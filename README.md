Characterter code constants.

These libraries define symbolic names for some character codes.

## Using

Import either one of the libraries:

    import "package:charcode/ascii.dart"
    import "package:charcode/html_entity.dart"

or import both libraries using the `charcode.dart` library:

    import "package:charcode/charcode.dart"

# Naming

The character names are preceded by a `$` to avoid conflicting with other
variables due to the short and common names (for example "$i").

The characters that are valid in a Dart identifier directly follow the `$`.
Examples: `$_`, `$a`, `$B` and `$3`. Other characters are given symbolic names.

The names of letters are lower-case for lower-case letters, and mixed- or
upper-case for upper-case letters. The names of symbols are all lower-case,
and omit suffixes like "sign", "symbol" and "mark". E
xamples: `$plus`, `$exclamation`

The `ascii.dart` library defines a symbolic name for each ASCII character.
For some chraceters, it has more than one name. For example the common `$tab`
and the official `$ht` for the horisontal tab.

The `html_entity.dart` library defines a constant for each HTML 4.01 character
entity, using the standard entity abbreviation, incluing its case.
Examples: `$nbsp` for `&nbps;`, `$aring` for the lower-case `&aring;`
and `$Aring` for the upper-case `&Aring;`.

The HTML entities includes all characters in the Latin-1 code page, greek
letters and some mathematical symbols.

The `charcode.dart` library just exports both `ascii.dart` and
`html_entity.dart`.
