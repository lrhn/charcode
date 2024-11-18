// Copyright (c) 2022, Google Inc.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source is governed by a
// BSD-style license that can be found in the LICENSE file.

import "package:test/test.dart";
import "../bin/src/argc.dart";

void main() {
  test("empty", () {
    var argc = CmdLineScanner([]);
    expect(argc.moveNext(), false);
  });

  test("one short flag", () {
    var argc = CmdLineScanner(["-f"]);
    expect(argc.moveNext(), true);
    expect(argc.isOption, true);
    expect(argc.isShort, true);
    expect(argc.current, "f");
    expect(argc.currentFlagCharCode, 0x66 /*f*/);
    expect(argc.hasValue, false);
    expect(argc.moveNext(), false);
  });

  test("one long flag", () {
    var argc = CmdLineScanner(["--fidelius"]);
    expect(argc.moveNext(), true);
    expect(argc.isOption, true);
    expect(argc.isShort, false);
    expect(argc.current, "fidelius");
    expect(() => argc.currentFlagCharCode, throwsStateError);
    expect(argc.hasValue, false);
    expect(argc.moveNext(), false);
  });

  test("one literal", () {
    var argc = CmdLineScanner(["leviosa"]);
    expect(argc.moveNext(), true);
    expect(argc.isOption, false);
    expect(argc.isShort, false);
    expect(argc.current, "leviosa");
    expect(() => argc.currentFlagCharCode, throwsStateError);
    expect(argc.hasValue, false);
    expect(argc.moveNext(), false);
  });

  test("single - is a literal", () {
    var argc = CmdLineScanner(["-"]);
    expect(argc.moveNext(), true);
    expect(argc.isOption, false);
    expect(argc.isShort, false);
    expect(argc.current, "-");
    expect(() => argc.currentFlagCharCode, throwsStateError);
    expect(argc.hasValue, false);
    expect(argc.moveNext(), false);
  });

  test("single -- is an empty option", () {
    var argc = CmdLineScanner(["--"]);
    expect(argc.moveNext(), true);
    expect(argc.isOption, true);
    expect(argc.isShort, false);
    expect(argc.current, "");
    expect(() => argc.currentFlagCharCode, throwsStateError);
    expect(argc.hasValue, false);
    expect(argc.moveNext(), false);
  });

  test("combined short with value", () {
    var argc = CmdLineScanner(["-xyval"]);
    expect(argc.moveNext(), true);
    expect(argc.isOption, true);
    expect(argc.isShort, true);
    expect(argc.current, "x");
    expect(argc.currentFlagCharCode, "x".codeUnitAt(0));
    expect(argc.hasValue, true);
    expect(argc.moveNext(), true);
    expect(argc.isOption, true);
    expect(argc.isShort, true);
    expect(argc.current, "y");
    expect(argc.currentFlagCharCode, "y".codeUnitAt(0));
    expect(argc.hasValue, true);
    expect(argc.moveNextValue(), true);
    expect(argc.isValue, true);
    expect(argc.currentValue, "val");
    expect(argc.moveNextValue(), false);
  });
  test("multiple short with values", () {
    var argc = CmdLineScanner(["-xval1", "-y", "val2", "-z"]);
    expect(argc.moveNext(), true);
    expect(argc.isOption, true);
    expect(argc.isShort, true);
    expect(argc.current, "x");
    expect(argc.currentFlagCharCode, "x".codeUnitAt(0));
    expect(argc.hasValue, true);
    expect(argc.moveNextValue(), true);
    expect(argc.isValue, true);
    expect(argc.currentValue, "val1");
    expect(argc.moveNext(), true);
    expect(argc.isOption, true);
    expect(argc.isShort, true);
    expect(argc.current, "y");
    expect(argc.currentFlagCharCode, "y".codeUnitAt(0));
    expect(argc.hasValue, true);
    expect(argc.moveNextValue(), true);
    expect(argc.isValue, true);
    expect(argc.currentValue, "val2");
    expect(argc.moveNext(), true);
    expect(argc.isOption, true);
    expect(argc.isShort, true);
    expect(argc.current, "z");
    expect(argc.hasValue, false);
    expect(argc.moveNextValue(), false);
    expect(argc.isValue, false);
    expect(argc.moveNext(), false);
  });

  test("multiple longs with values", () {
    var argc = CmdLineScanner(["--xx=val1", "--yy", "val2", "--zz"]);
    expect(argc.moveNext(), true);
    expect(argc.isOption, true);
    expect(argc.isShort, false);
    expect(argc.current, "xx");
    expect(() => argc.currentFlagCharCode, throwsStateError);
    expect(argc.hasValue, true);
    expect(argc.moveNextValue(), true);
    expect(argc.isValue, true);
    expect(argc.currentValue, "val1");
    expect(argc.moveNext(), true);
    expect(argc.isOption, true);
    expect(argc.isShort, false);
    expect(argc.current, "yy");
    expect(() => argc.currentFlagCharCode, throwsStateError);
    expect(argc.hasValue, true);
    expect(argc.moveNextValue(), true);
    expect(argc.isValue, true);
    expect(argc.currentValue, "val2");
    expect(argc.moveNext(), true);
    expect(argc.isOption, true);
    expect(argc.isShort, false);
    expect(argc.current, "zz");
    expect(argc.hasValue, false);
    expect(argc.moveNextValue(), false);
    expect(argc.isValue, false);
    expect(argc.moveNext(), false);
  });

  test("next not value", () {
    var argc = CmdLineScanner(["-x", "--y", "-z"]);
    expect(argc.moveNext(), true);
    expect(argc.current, "x");
    expect(argc.hasValue, false);
    expect(argc.moveNextValue(), false);
    expect(argc.moveNext(), true);
    expect(argc.current, "y");
    expect(argc.hasValue, false);
    expect(argc.moveNextValue(), false);
    expect(argc.moveNext(), true);
    expect(argc.current, "z");
    expect(argc.hasValue, false);
    expect(argc.moveNext(), false);
  });
}
