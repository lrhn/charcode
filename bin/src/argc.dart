// Copyright (c) 2020, Google Inc. Please see the AUTHORS file
// for details. All rights reserved. Use of this source is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Tokenizer for command-line flags and options.
///
/// A command line flag is either one-dash-one-letter (like `-n`)
/// or two-dashes-and-a-name like `--name`.
///
/// A single `-` by itself is treated as a literal.
/// A `--` by itself is treated like a flag with an empty name string.
///
/// The "letter" is a single ASCII letter or digit.
/// Multiple single-letter flags can be combined in a single dash, `-xyz`
/// is the same as `-x -y -z`.
///
/// The name is a sequence of ASCII letters, digits, underscores (`_`),
/// hyphens (`-`), or dots (`.`).
/// A flag represents a boolean value. If it's present, it is considered
/// true. A flag name prefixed by `no-`, `no-` or `no.` often represents a
/// false value, but that should be handled by the parser. This tokenizer
/// does not make a distinction.
///
/// A command line *option* has the same syntax as a flag, but optionally
/// followed by a value.
///
/// An one-dash-one-letter option is either directly followed by its
/// value string, or the option letter is at the end of its argument string,
/// and the value string is the entire next argument.
/// ```
/// -xFoo
/// -x Foo
/// -byx Foo
/// ```
///
/// A named option is either followed by `=value` in the same argument,
/// or the value is the entire next argument:
/// ```
/// --xyzzy=Foo
/// --xyzzy Foo
/// ```
/// It's a mistake if a named option ends with `=` and the value is
/// not read.
class CmdLineScanner {
  /// No flag or option read, no value available.
  ///
  /// The state before and after iteration.
  ///
  /// Examples of where [current] might point.
  /// ```
  ///   --xyz bif -gin --arg=123 foo
  /// ^                              ^ (after moveNext returned false)
  /// ```
  static const int _stateNone = 0;

  /// An option or flag was found at the end of the current argument.
  ///
  /// State after [moveNext] has returned true and found either a named
  /// option (`--name`) not followed by `=`, or a single letter
  /// option flag not followed by more characters.
  /// Any value will be the next argument string.
  ///
  /// Examples:
  /// ```
  ///   --xyz bif -gin --arg=123 foo
  ///     ^^^        ^
  /// ```
  static const int _stateName = 1;

  /// A letter was read, and not the last letter in the argument.
  ///
  /// State after [moveNext] has returned true for a single-letter
  /// option flag, and where there are more character left in the
  /// current argument string (a potential value or more single-letter
  /// flags).
  static const int _stateLetter = 2;

  /// Examples:
  /// ```
  ///   --xyz bif -gin --arg=123 foo
  ///              ^^ (two individual single-character current values)
  /// ```

  /// An option with a `=` was found.
  ///
  /// State after [moveNext] has returned true and found a `--name=` option.
  /// The rest of the current argument is definitely a value.
  ///
  /// Examples:
  /// ```
  ///   --xyz bif -gin --arg=123 foo
  ///                    ^^^
  /// ```
  static const int _stateWordEquals = 3;

  /// Has read a value.
  ///
  /// State after [moveNextValue] has returned true.
  ///
  /// Examples (potential, depending on whether [moveNextValue] was called):
  /// ```
  ///   --xyz bif -gin --arg=123 foo
  ///         ^^^   ^^       ^^^
  /// ```
  static const int _stateValue = 4;

  /// Has read a non-option.
  ///
  /// State after [moveNext] has returned true and not found an option.
  ///
  /// Examples:
  /// ```
  ///   --xyz bif -gin --arg=123 foo
  ///         ^^^                ^^^
  /// ```
  static const int _stateLiteral = 5;

  /// The list af command line arguments being scanned.
  final List<String> _input;

  /// The index of the currently processed input argument.
  int _index = 0;

  /// Argument string containing current name, value or literal.
  String _currentString = "";

  /// Start index of current name, value or literal in [_currentString].
  int _currentStart = -1;

  /// End index of current name, value or literal in [_currentString].
  int _currentEnd = -1;

  /// Current state depending on what has previosuly been seen.
  ///
  /// One of the `_state*` constants above.
  int _state = _stateNone;

  /// Creates a scanner for [arguments].
  ///
  /// It is initially in a state where there is no [current].
  CmdLineScanner(List<String> arguments) : _input = arguments;

  /// Whether the current element of the iteration is an option.
  ///
  /// Is true after [moveNext] has found a single-character or named option.
  ///
  /// Mutually exclusive with [isValue] and [isLiteral].
  bool get isOption =>
      _state == _stateLetter ||
      _state == _stateName ||
      _state == _stateWordEquals;

  /// Whether the current element is a single-dash option.
  ///
  /// Used to distinguish between `--x` and `-x`, which are both
  /// options ([isOption]) with the same name (`"x"`).
  bool get isShort => (_state == _stateLetter ||
      _state == _stateName && !_currentString.startsWith("--"));

  /// Whether the current element is an option value.
  ///
  /// Only true after calling [moveNextValue].
  ///
  /// Mutually exclusive with [isOption] and [isLiteral].
  bool get isValue => _state == _stateValue;

  /// Whether the current option has a potential value.
  ///
  /// Only true when [current] is an option ([isOption]),
  /// which is followed by something which can be used as a value.
  /// That can be either `--foo=anything`, `-fanything`, or it can
  /// be `--foo value` or `-f value`, where `value` does not start
  /// with `-`.
  bool get hasValue =>
      _state == _stateWordEquals ||
      _state == _stateLetter ||
      ((_state == _stateName || _state == _stateValue) &&
          _index < _input.length &&
          !_input[_index].startsWith("-"));

  /// Whether the current element is a literal.
  ///
  /// True after [moveNext] has found a non-option.
  ///
  /// Mutually exclusive with [isOption] and [isValue].
  bool get isLiteral => _state == _stateLiteral;

  /// The current flag name, value string or literal argument.
  String get current => _state != _stateNone
      ? _currentString.substring(_currentStart, _currentEnd)
      : throw StateError("No current value");

  /// The full argument string containing the current name, value or literal.
  ///
  /// For an option like `-gin` (three single-character flags),
  /// the [currentArg] will be the string `"-gin"` after
  /// [moveNext] has found each of `g`, `i` and `n`.
  ///
  /// Use with [currentStart] and [currentEnd] to access the current
  /// name, value or literal without creating a new string.
  String get currentArg {
    if (_state == _stateNone) throw StateError("No current string");
    return _currentString;
  }

  /// The start index of the current name, value or literal in [currentArg].
  int get currentStart => _currentStart;

  /// The end index of the current name, value or literal in [currentArg].
  int get currentEnd => _currentEnd;

  /// The length of the current name, value or literal.
  int get currentLength => _currentStart - _currentEnd;

  /// Whether the [current] equals [string].
  ///
  /// Checks whether the string which is the current option character,
  /// option name, option value, or argument list literal,
  /// is equal to [string].
  bool isCurrent(String string) =>
      _currentEnd - _currentStart == string.length &&
      _currentString.startsWith(string, _currentStart);

  /// Whether [current] is an option named [string].
  ///
  /// Returns true if [current] is an option ([isOption]) and its
  /// name is [string].
  bool isCurrentOption(String string) => isOption && isCurrent(string);

  /// Whether the [current] is a single-letter (flag) option equal to [flag].
  ///
  /// Returns false if the current string is not a flag ([isShort]) or if its
  /// character is not the character of [flag].
  bool isCurrentFlag(String flag) {
    if (flag.length != 1) {
      throw ArgumentError.value(flag, "flag", "Must be a single character");
    }
    return isShort && isCurrent(flag);
  }

  /// Moves to the next part of the command line argument list, if any.
  ///
  /// A part is either an option or a literal (a non-option command line entry).
  /// Returns whether there are more parts.
  ///
  /// If another part is found,
  /// [current], [currentArgument], [currentStart] and [currentEnd]
  /// are updated to represent the option name or literal string.
  ///
  /// If not, the iteration is over.
  bool moveNext() {
    // Are there more characters in the current argument string?
    if (_state == _stateLetter) {
      _currentStart = _currentEnd;
      _currentEnd = _currentEnd + 1;
      if (_currentEnd == _currentString.length) {
        _index++;
        _state = _stateName;
      }
      return true;
    }
    if (_state == _stateWordEquals) {
      // Ignoring value. Bold move, but allowed.
      _index++;
      _state = _stateName;
    }
    if (_index < _input.length) {
      var arg = _input[_index];
      _currentString = arg;
      if (arg.startsWith("-")) {
        if (arg.startsWith("-", 1)) {
          _currentStart = 2;
          var equals = arg.indexOf("=", 2);
          if (equals >= 0) {
            _currentEnd = equals;
            _state = _stateWordEquals;
          } else {
            _currentEnd = arg.length;
            _state = _stateName;
            _index++;
          }
          // Includes the empty string for `--`.
          return true;
        }
        if (arg.length > 1) {
          _currentStart = 1;
          _currentEnd = 2;
          if (arg.length == 2) {
            _index++;
            _state = _stateName;
          } else {
            _state = _stateLetter;
          }
          return true;
        }
      }
      _currentStart = 0;
      _currentEnd = arg.length;
      _state = _stateLiteral;
      _index++;
      return true;
    }
    _currentString = "";
    _currentStart = _currentEnd = -1;
    return false;
  }

  /// Advances to the next command line argument and treats it as a literal.
  ///
  /// Ignores whether the next command line argument starts with `-` or not.
  /// Can, for example, be used to complete iteration after seeing a `--`
  /// option, without treating following elements as options.
  ///
  /// Skips any value if the current position is a `--foo=...` option
  /// or further letters in an `-xyz` option,
  /// and moves directly to the next command line entry.
  ///
  /// Returns whether there is a next argument string.
  /// If there is, [current], [currentArg], [currentStart] and [currentEnd]
  /// are set to point to it.
  bool moveNextLiteral() {
    var index = _index;
    if (_state == _stateLetter || _state == _stateWordEquals) {
      _index = ++index;
    }
    if (index < _input.length) {
      var arg = _input[index];
      _currentString = arg;
      _currentStart = 0;
      _currentEnd = arg.length;
      return true;
    }
    _currentString = "";
    _currentStart = _currentEnd = -1;
    return false;
  }

  /// Finds the next value, if any.
  ///
  /// Used only after [moveNext] or [moveNextValue] has returned `true`.
  ///
  /// An option may have a value in the same argument:
  /// * `-Dvalue`  - everything after the letter
  /// * `--mode=safe` - everthing after the first `=`.
  ///
  /// Alternatively, the value an be the *next* argument, but only
  /// if that argument does not start with a `-`.
  /// * `-D value`
  /// * `--mode safe`
  /// * but not `--mode --safe`
  ///
  /// This behavior can be disabled by passing `false` as [allowNext].
  ///
  /// An option may have multiple values, for example something like
  /// `--replace xyz abc`. Calling [moveNextValue] after matching
  /// will move to the next value, if there is one.
  ///
  /// Returns `true` if a value was found and `false` if not.
  /// If no value was found, the state of the iterator does not
  /// change.
  bool moveNextValue({bool allowNext = true}) {
    if (_state == _stateLetter || _state == _stateWordEquals) {
      var arg = _input[_index];
      _index++;
      _currentString = arg;
      _currentStart = _currentEnd + (_state == _stateWordEquals ? 1 : 0);
      _currentEnd = arg.length;
      _state = _stateValue;
      return true;
    }
    if (_state == _stateName || _state == _stateValue) {
      if (allowNext && _index < _input.length) {
        var next = _input[_index];
        if (!next.startsWith('-')) {
          _currentString = next;
          _currentStart = 0;
          _currentEnd = next.length;
          _index++;
          _state = _stateValue;
          return true;
        }
      }
      return false;
    }
    throw StateError("No current option");
  }

  /// The current option value.
  ///
  /// The same as [current], but only valid after a call to [moveNextValue]
  /// has returned true (when [isValue] is true).
  String get currentValue {
    if (_state != _stateValue) throw StateError("No current value");
    return _currentString.substring(_currentStart, _currentEnd);
  }

  /// The current option name.
  ///
  /// The same as [current], but only valid after a call to [moveNext]
  /// has returned true and [isOption] is true.
  String get currentName {
    if (_state == _stateNone ||
        _state == _stateLiteral ||
        _state == _stateValue) {
      throw StateError("No current option");
    }
    return _currentString.substring(_currentStart, _currentEnd);
  }

  /// The character code of the current flag.
  ///
  /// Can only be used when [isShort] is true.
  /// Returns the [String.codeUnitAt] of the single character which is the flag.
  int get currentFlagCharCode {
    if (_state != _stateLetter &&
        !(_state == _stateName && !_currentString.startsWith("--"))) {
      throw StateError("No current short option");
    }

    return _currentString.codeUnitAt(_currentStart);
  }

  /// The current literal string.
  ///
  /// The same as [current], but only valid after a call to [moveNext]
  /// has returned true and [isLiteral] is true.
  String get currentLiteral {
    if (_state != _stateLiteral) throw StateError("No current literal");
    return _currentString.substring(_currentStart, _currentEnd);
  }

  /// Ends parsing and returns all remaining command line arguments as literals.
  ///
  /// Ignores whether there are any further arguments starting with `-`.
  /// Ignores the value of a current `--foo=value` option or the remaining
  /// letters of an `-xyz` option and skips directly to the next command
  /// line argument.
  ///
  /// Can be used, for example, after seeing a `--` option.
  /// Alternatively use [moveNextLiteral] to keep iterating the rest
  /// of the command line as literals.
  List<String> rest() {
    if (_state == _stateLetter || _state == _stateWordEquals) {
      // skip rest of current argument
      _index++;
    }
    _state = _stateNone;
    _currentString = "";
    _currentStart = _currentEnd = -1;
    return _input.sublist(_index);
  }
}
