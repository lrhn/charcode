-[![Build Status](https://travis-ci.org/lrhn/charcode.svg?branch=master)](https://travis-ci.org/lrhn/charcode)
-[![Pub](https://img.shields.io/pub/v/charcode.svg)](https://pub.dev/packages/charcode) -

# Character code constants

This package defines symbolic names for some character codes (aka. code points).

They can used when working directly with characters as integers,
to make the code more readable: `if (firstChar == $A) ...`.

This is not an official Google package, and is not supported by Google.

## Usage

Import either one of the libraries:
```dart
import "package:charcode/ascii.dart";
import "package:charcode/html_entity.dart";
```
or import both libraries using the `charcode.dart` library:
```dart
import "package:charcode/charcode.dart";
```

## Naming

The character names are preceded by a `$` to avoid conflicting with other
variables, due to their short and common names (for example "$i").

Characters that are valid in a Dart identifier directly follow the `$`.
Examples: `$_`, `$a`, `$B` and `$3`. Other characters are given symbolic names.

The names of letters are lower-case for lower-case letters (`$sigma` for `σ`),
and mixed- or upper-case for upper-case letters (`$Sigma` for `Σ`).
The names of symbols and punctuation are all lower-case,
and omit suffixes like "sign", "symbol" and "mark".
Examples: `$plus`, `$exclamation`, `$tilde`.

The `ascii.dart` library defines a symbolic name for each ASCII character.
Some characters have more than one name. For example the common name `$tab`
and the official abbreviation `$ht` for the horisontal tab.

The `html_entity.dart` library defines a constant for each HTML 4.01 character
entity using their standard entity abbreviation, including case.
Examples: `$nbsp` for `&nbps;`, `$aring` for the lower-case `&aring;`
and `$Aring` for the upper-case `&Aring;`.

The HTML entities include all characters in the Latin-1 code page, greek
letters and some mathematical symbols.

The `charcode.dart` library exports both `ascii.dart` and
`html_entity.dart`. Where both libraries define the same name,
the HTML entity name is preferred.

## Rationale

The Dart language doesn't have character literals.
If that ever changes, this package will become irrelevant.
Until then, this package can be used for the most common characters.
See [http://dartbug.com/4415](request for character literals).
