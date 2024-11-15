// Copyright (c) 2020, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source is governed by a
// BSD-style license that can be found in the LICENSE file.

part 'src/charcodes.dart';

void main() {
  print(String.fromCharCodes([
    _E,
    _x,
    _a,
    _m,
    _p,
    _l,
    _e,
    _exclamation,
  ]));

  if (!hasBalancedParentheses(
      '(((a + b) + (c + d)) + (((e + f) + (g + h)) + i))')) {
    print('Unbalanced!');
  }
}

/// Check whether `(` and `)` are balanced in [input].
bool hasBalancedParentheses(String input) {
  var openParenCount = 0;
  for (var i = 0; i < input.length; i++) {
    var char = input.codeUnitAt(i);
    if (char == _lparen) {
      openParenCount++;
    } else if (char == _rparen) {
      openParenCount--;
      if (openParenCount < 0) return false;
    }
  }
  return openParenCount == 0;
}
