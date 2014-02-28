// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source is governed by a
// BSD-style license that can be found in the LICENSE file.

/**
 * Character codes based on HTML 4.01 character entity names.
 *
 * For each entity name, e.g., `nbsp`,
 * a constant with that name prefixed by `$` is defined
 * for that entity's code point.
 *
 * The HTML entities include the non-ASCII Latin-1 characters and
 * symbols, mathematical symbols and Greek litters.
 *
 * The five characters that are ASCII
 * are exported from the "ascii.dart" library,
 * so the libraries can both be imported without conflict.
 */
library charcode.htmlentity.dollar_lowercase;

export "ascii.dart" show $quot, $amp, $apos, $lt, $gt;

/// no-break space (non-breaking space)
static const int $nbsp     = 0x00A0;
/// inverted exclamation mark ('¡')
static const int $iexcl    = 0x00A1;
/// cent sign ('¢')
static const int $cent     = 0x00A2;
/// pound sign ('£')
static const int $pound    = 0x00A3;
/// currency sign ('¤')
static const int $curren   = 0x00A4;
/// yen sign (yuan sign) ('¥')
static const int $yen      = 0x00A5;
/// broken bar (broken vertical bar) ('¦')
static const int $brvbar   = 0x00A6;
/// section sign ('§')
static const int $sect     = 0x00A7;
/// diaeresis (spacing diaeresis); see Germanic umlaut ('¨')
static const int $uml      = 0x00A8;
/// copyright symbol ('©')
static const int $copy     = 0x00A9;
/// feminine ordinal indicator ('ª')
static const int $ordf     = 0x00AA;
/// left-pointing double angle quotation mark (left pointing guillemet) ('«')
static const int $laquo    = 0x00AB;
/// not sign ('¬')
static const int $not      = 0x00AC;
/// soft hyphen (discretionary hyphen)
static const int $shy      = 0x00AD;
/// registered sign (registered trademark symbol) ('®')
static const int $reg      = 0x00AE;
/// macron (spacing macron, overline, APL overbar) ('¯')
static const int $macr     = 0x00AF;
/// degree symbol ('°')
static const int $deg      = 0x00B0;
/// plus-minus sign (plus-or-minus sign) ('±')
static const int $plusmn   = 0x00B1;
/// superscript two (superscript digit two, squared) ('²')
static const int $sup2     = 0x00B2;
/// superscript three (superscript digit three, cubed) ('³')
static const int $sup3     = 0x00B3;
/// acute accent (spacing acute) ('´')
static const int $acute    = 0x00B4;
/// micro sign ('µ')
static const int $micro    = 0x00B5;
/// pilcrow sign (paragraph sign) ('¶')
static const int $para     = 0x00B6;
/// middle dot (Georgian comma, Greek middle dot) ('·')
static const int $middot   = 0x00B7;
/// cedilla (spacing cedilla) ('¸')
static const int $cedil    = 0x00B8;
/// superscript one (superscript digit one) ('¹')
static const int $sup1     = 0x00B9;
/// masculine ordinal indicator ('º')
static const int $ordm     = 0x00BA;
/// right-pointing double angle quotation mark (right pointing guillemet) ('»')
static const int $raquo    = 0x00BB;
/// vulgar fraction one quarter (fraction one quarter) ('¼')
static const int $frac14   = 0x00BC;
/// vulgar fraction one half (fraction one half) ('½')
static const int $frac12   = 0x00BD;
/// vulgar fraction three quarters (fraction three quarters) ('¾')
static const int $frac34   = 0x00BE;
/// inverted question mark (turned question mark) ('¿')
static const int $iquest   = 0x00BF;
/// Latin capital letter A with grave accent (Latin capital letter A grave) ('À')
static const int $Agrave   = 0x00C0;
/// Latin capital letter A with acute accent ('Á')
static const int $Aacute   = 0x00C1;
/// Latin capital letter A with circumflex ('Â')
static const int $Acirc    = 0x00C2;
/// Latin capital letter A with tilde ('Ã')
static const int $Atilde   = 0x00C3;
/// Latin capital letter A with diaeresis ('Ä')
static const int $Auml     = 0x00C4;
/// Latin capital letter A with ring above (Latin capital letter A ring) ('Å')
static const int $Aring    = 0x00C5;
/// Latin capital letter AE (Latin capital ligature AE) ('Æ')
static const int $AElig    = 0x00C6;
/// Latin capital letter C with cedilla ('Ç')
static const int $Ccedil   = 0x00C7;
/// Latin capital letter E with grave accent ('È')
static const int $Egrave   = 0x00C8;
/// Latin capital letter E with acute accent ('É')
static const int $Eacute   = 0x00C9;
/// Latin capital letter E with circumflex ('Ê')
static const int $Ecirc    = 0x00CA;
/// Latin capital letter E with diaeresis ('Ë')
static const int $Euml     = 0x00CB;
/// Latin capital letter I with grave accent ('Ì')
static const int $Igrave   = 0x00CC;
/// Latin capital letter I with acute accent ('Í')
static const int $Iacute   = 0x00CD;
/// Latin capital letter I with circumflex ('Î')
static const int $Icirc    = 0x00CE;
/// Latin capital letter I with diaeresis ('Ï')
static const int $Iuml     = 0x00CF;
/// Latin capital letter Eth ('Ð')
static const int $ETH      = 0x00D0;
/// Latin capital letter N with tilde ('Ñ')
static const int $Ntilde   = 0x00D1;
/// Latin capital letter O with grave accent ('Ò')
static const int $Ograve   = 0x00D2;
/// Latin capital letter O with acute accent ('Ó')
static const int $Oacute   = 0x00D3;
/// Latin capital letter O with circumflex ('Ô')
static const int $Ocirc    = 0x00D4;
/// Latin capital letter O with tilde ('Õ')
static const int $Otilde   = 0x00D5;
/// Latin capital letter O with diaeresis ('Ö')
static const int $Ouml     = 0x00D6;
/// multiplication sign ('×')
static const int $times    = 0x00D7;
/// Latin capital letter O with stroke (Latin capital letter O slash) ('Ø')
static const int $Oslash   = 0x00D8;
/// Latin capital letter U with grave accent ('Ù')
static const int $Ugrave   = 0x00D9;
/// Latin capital letter U with acute accent ('Ú')
static const int $Uacute   = 0x00DA;
/// Latin capital letter U with circumflex ('Û')
static const int $Ucirc    = 0x00DB;
/// Latin capital letter U with diaeresis ('Ü')
static const int $Uuml     = 0x00DC;
/// Latin capital letter Y with acute accent ('Ý')
static const int $Yacute   = 0x00DD;
/// Latin capital letter THORN ('Þ')
static const int $THORN    = 0x00DE;
/// Latin small letter sharp s (ess-zed); see German Eszett ('ß')
static const int $szlig    = 0x00DF;
/// Latin small letter a with grave accent ('à')
static const int $agrave   = 0x00E0;
/// Latin small letter a with acute accent ('á')
static const int $aacute   = 0x00E1;
/// Latin small letter a with circumflex ('â')
static const int $acirc    = 0x00E2;
/// Latin small letter a with tilde ('ã')
static const int $atilde   = 0x00E3;
/// Latin small letter a with diaeresis ('ä')
static const int $auml     = 0x00E4;
/// Latin small letter a with ring above ('å')
static const int $aring    = 0x00E5;
/// Latin small letter ae (Latin small ligature ae) ('æ')
static const int $aelig    = 0x00E6;
/// Latin small letter c with cedilla ('ç')
static const int $ccedil   = 0x00E7;
/// Latin small letter e with grave accent ('è')
static const int $egrave   = 0x00E8;
/// Latin small letter e with acute accent ('é')
static const int $eacute   = 0x00E9;
/// Latin small letter e with circumflex ('ê')
static const int $ecirc    = 0x00EA;
/// Latin small letter e with diaeresis ('ë')
static const int $euml     = 0x00EB;
/// Latin small letter i with grave accent ('ì')
static const int $igrave   = 0x00EC;
/// Latin small letter i with acute accent ('í')
static const int $iacute   = 0x00ED;
/// Latin small letter i with circumflex ('î')
static const int $icirc    = 0x00EE;
/// Latin small letter i with diaeresis ('ï')
static const int $iuml     = 0x00EF;
/// Latin small letter eth ('ð')
static const int $eth      = 0x00F0;
/// Latin small letter n with tilde ('ñ')
static const int $ntilde   = 0x00F1;
/// Latin small letter o with grave accent ('ò')
static const int $ograve   = 0x00F2;
/// Latin small letter o with acute accent ('ó')
static const int $oacute   = 0x00F3;
/// Latin small letter o with circumflex ('ô')
static const int $ocirc    = 0x00F4;
/// Latin small letter o with tilde ('õ')
static const int $otilde   = 0x00F5;
/// Latin small letter o with diaeresis ('ö')
static const int $ouml     = 0x00F6;
/// division sign (obelus) ('÷')
static const int $divide   = 0x00F7;
/// Latin small letter o with stroke (Latin small letter o slash) ('ø')
static const int $oslash   = 0x00F8;
/// Latin small letter u with grave accent ('ù')
static const int $ugrave   = 0x00F9;
/// Latin small letter u with acute accent ('ú')
static const int $uacute   = 0x00FA;
/// Latin small letter u with circumflex ('û')
static const int $ucirc    = 0x00FB;
/// Latin small letter u with diaeresis ('ü')
static const int $uuml     = 0x00FC;
/// Latin small letter y with acute accent ('ý')
static const int $yacute   = 0x00FD;
/// Latin small letter thorn ('þ')
static const int $thorn    = 0x00FE;
/// Latin small letter y with diaeresis ('ÿ')
static const int $yuml     = 0x00FF;
/// Latin capital ligature oe ('Œ')
static const int $OElig    = 0x0152;
/// Latin small ligature oe ('œ')
static const int $oelig    = 0x0153;
/// Latin capital letter s with caron ('Š')
static const int $Scaron   = 0x0160;
/// Latin small letter s with caron ('š')
static const int $scaron   = 0x0161;
/// Latin capital letter y with diaeresis ('Ÿ')
static const int $Yuml     = 0x0178;
/// Latin small letter f with hook (function, florin) ('ƒ')
static const int $fnof     = 0x0192;
/// modifier letter circumflex accent ('ˆ')
static const int $circ     = 0x02C6;
/// small tilde ('˜')
static const int $tilde    = 0x02DC;
/// Greek capital letter Alpha ('Α')
static const int $Alpha    = 0x0391;
/// Greek capital letter Beta ('Β')
static const int $Beta     = 0x0392;
/// Greek capital letter Gamma ('Γ')
static const int $Gamma    = 0x0393;
/// Greek capital letter Delta ('Δ')
static const int $Delta    = 0x0394;
/// Greek capital letter Epsilon ('Ε')
static const int $Epsilon  = 0x0395;
/// Greek capital letter Zeta ('Ζ')
static const int $Zeta     = 0x0396;
/// Greek capital letter Eta ('Η')
static const int $Eta      = 0x0397;
/// Greek capital letter Theta ('Θ')
static const int $Theta    = 0x0398;
/// Greek capital letter Iota ('Ι')
static const int $Iota     = 0x0399;
/// Greek capital letter Kappa ('Κ')
static const int $Kappa    = 0x039A;
/// Greek capital letter Lambda ('Λ')
static const int $Lambda   = 0x039B;
/// Greek capital letter Mu ('Μ')
static const int $Mu       = 0x039C;
/// Greek capital letter Nu ('Ν')
static const int $Nu       = 0x039D;
/// Greek capital letter Xi ('Ξ')
static const int $Xi       = 0x039E;
/// Greek capital letter Omicron ('Ο')
static const int $Omicron  = 0x039F;
/// Greek capital letter Pi ('Π')
static const int $Pi       = 0x03A0;
/// Greek capital letter Rho ('Ρ')
static const int $Rho      = 0x03A1;
/// Greek capital letter Sigma ('Σ')
static const int $Sigma    = 0x03A3;
/// Greek capital letter Tau ('Τ')
static const int $Tau      = 0x03A4;
/// Greek capital letter Upsilon ('Υ')
static const int $Upsilon  = 0x03A5;
/// Greek capital letter Phi ('Φ')
static const int $Phi      = 0x03A6;
/// Greek capital letter Chi ('Χ')
static const int $Chi      = 0x03A7;
/// Greek capital letter Psi ('Ψ')
static const int $Psi      = 0x03A8;
/// Greek capital letter Omega ('Ω')
static const int $Omega    = 0x03A9;
/// Greek small letter alpha ('α')
static const int $alpha    = 0x03B1;
/// Greek small letter beta ('β')
static const int $beta     = 0x03B2;
/// Greek small letter gamma ('γ')
static const int $gamma    = 0x03B3;
/// Greek small letter delta ('δ')
static const int $delta    = 0x03B4;
/// Greek small letter epsilon ('ε')
static const int $epsilon  = 0x03B5;
/// Greek small letter zeta ('ζ')
static const int $zeta     = 0x03B6;
/// Greek small letter eta ('η')
static const int $eta      = 0x03B7;
/// Greek small letter theta ('θ')
static const int $theta    = 0x03B8;
/// Greek small letter iota ('ι')
static const int $iota     = 0x03B9;
/// Greek small letter kappa ('κ')
static const int $kappa    = 0x03BA;
/// Greek small letter lambda ('λ')
static const int $lambda   = 0x03BB;
/// Greek small letter mu ('μ')
static const int $mu       = 0x03BC;
/// Greek small letter nu ('ν')
static const int $nu       = 0x03BD;
/// Greek small letter xi ('ξ')
static const int $xi       = 0x03BE;
/// Greek small letter omicron ('ο')
static const int $omicron  = 0x03BF;
/// Greek small letter pi ('π')
static const int $pi       = 0x03C0;
/// Greek small letter rho ('ρ')
static const int $rho      = 0x03C1;
/// Greek small letter final sigma ('ς')
static const int $sigmaf   = 0x03C2;
/// Greek small letter sigma ('σ')
static const int $sigma    = 0x03C3;
/// Greek small letter tau ('τ')
static const int $tau      = 0x03C4;
/// Greek small letter upsilon ('υ')
static const int $upsilon  = 0x03C5;
/// Greek small letter phi ('φ')
static const int $phi      = 0x03C6;
/// Greek small letter chi ('χ')
static const int $chi      = 0x03C7;
/// Greek small letter psi ('ψ')
static const int $psi      = 0x03C8;
/// Greek small letter omega ('ω')
static const int $omega    = 0x03C9;
/// Greek theta symbol ('ϑ')
static const int $thetasym = 0x03D1;
/// Greek Upsilon with hook symbol ('ϒ')
static const int $upsih    = 0x03D2;
/// Greek pi symbol ('ϖ')
static const int $piv      = 0x03D6;
/// en space (' ')
static const int $ensp     = 0x2002;
/// em space (' ')
static const int $emsp     = 0x2003;
/// thin space
static const int $thinsp   = 0x2009;
/// zero-width non-joiner
static const int $zwnj     = 0x200C;
/// zero-width joiner
static const int $zwj      = 0x200D;
/// left-to-right mark
static const int $lrm      = 0x200E;
/// right-to-left mark
static const int $rlm      = 0x200F;
/// en dash ('–')
static const int $ndash    = 0x2013;
/// em dash ('—')
static const int $mdash    = 0x2014;
/// left single quotation mark ('‘')
static const int $lsquo    = 0x2018;
/// right single quotation mark ('’')
static const int $rsquo    = 0x2019;
/// single low-9 quotation mark ('‚')
static const int $sbquo    = 0x201A;
/// left double quotation mark ('“')
static const int $ldquo    = 0x201C;
/// right double quotation mark ('”')
static const int $rdquo    = 0x201D;
/// double low-9 quotation mark ('„')
static const int $bdquo    = 0x201E;
/// dagger, obelisk ('†')
static const int $dagger   = 0x2020;
/// double dagger, double obelisk ('‡')
static const int $Dagger   = 0x2021;
/// bullet (black small circle) ('•')
static const int $bull     = 0x2022;
/// horizontal ellipsis (three dot leader) ('…')
static const int $hellip   = 0x2026;
/// per mille sign ('‰')
static const int $permil   = 0x2030;
/// prime (minutes, feet) ('′')
static const int $prime    = 0x2032;
/// double prime (seconds, inches) ('″')
static const int $Prime    = 0x2033;
/// single left-pointing angle quotation mark ('‹')
static const int $lsaquo   = 0x2039;
/// single right-pointing angle quotation mark ('›')
static const int $rsaquo   = 0x203A;
/// overline (spacing overscore) ('‾')
static const int $oline    = 0x203E;
/// fraction slash (solidus) ('⁄')
static const int $frasl    = 0x2044;
/// euro sign ('€')
static const int $euro     = 0x20AC;
/// black-letter capital I (imaginary part) ('ℑ')
static const int $image    = 0x2111;
/// script capital P (power set, Weierstrass p) ('℘')
static const int $weierp   = 0x2118;
/// black-letter capital R (real part symbol) ('ℜ')
static const int $real     = 0x211C;
/// trademark symbol ('™')
static const int $trade    = 0x2122;
/// alef symbol (first transfinite cardinal) ('ℵ')
static const int $alefsym  = 0x2135;
/// leftwards arrow ('←')
static const int $larr     = 0x2190;
/// upwards arrow ('↑')
static const int $uarr     = 0x2191;
/// rightwards arrow ('→')
static const int $rarr     = 0x2192;
/// downwards arrow ('↓')
static const int $darr     = 0x2193;
/// left right arrow ('↔')
static const int $harr     = 0x2194;
/// downwards arrow with corner leftwards (carriage return) ('↵')
static const int $crarr    = 0x21B5;
/// leftwards double arrow ('⇐')
static const int $lArr     = 0x21D0;
/// upwards double arrow ('⇑')
static const int $uArr     = 0x21D1;
/// rightwards double arrow ('⇒')
static const int $rArr     = 0x21D2;
/// downwards double arrow ('⇓')
static const int $dArr     = 0x21D3;
/// left right double arrow ('⇔')
static const int $hArr     = 0x21D4;
/// for all ('∀')
static const int $forall   = 0x2200;
/// partial differential ('∂')
static const int $part     = 0x2202;
/// there exists ('∃')
static const int $exist    = 0x2203;
/// empty set (null set); see also U+8960, ⌀ ('∅')
static const int $empty    = 0x2205;
/// del or nabla (vector differential operator) ('∇')
static const int $nabla    = 0x2207;
/// element of ('∈')
static const int $isin     = 0x2208;
/// not an element of ('∉')
static const int $notin    = 0x2209;
/// contains as member ('∋')
static const int $ni       = 0x220B;
/// n-ary product (product sign) ('∏')
static const int $prod     = 0x220F;
/// n-ary summation ('∑')
static const int $sum      = 0x2211;
/// minus sign ('−')
static const int $minus    = 0x2212;
/// asterisk operator ('∗')
static const int $lowast   = 0x2217;
/// square root (radical sign) ('√')
static const int $radic    = 0x221A;
/// proportional to ('∝')
static const int $prop     = 0x221D;
/// infinity ('∞')
static const int $infin    = 0x221E;
/// angle ('∠')
static const int $ang      = 0x2220;
/// logical and (wedge) ('∧')
static const int $and      = 0x2227;
/// logical or (vee) ('∨')
static const int $or       = 0x2228;
/// intersection (cap) ('∩')
static const int $cap      = 0x2229;
/// union (cup) ('∪')
static const int $cup      = 0x222A;
/// integral ('∫')
static const int $int      = 0x222B;
/// therefore sign ('∴')
static const int $there4   = 0x2234;
/// tilde operator (varies with, similar to) ('∼')
static const int $sim      = 0x223C;
/// congruent to ('≅')
static const int $cong     = 0x2245;
/// almost equal to (asymptotic to) ('≈')
static const int $asymp    = 0x2248;
/// not equal to ('≠')
static const int $ne       = 0x2260;
/// identical to; sometimes used for 'equivalent to' ('≡')
static const int $equiv    = 0x2261;
/// less-than or equal to ('≤')
static const int $le       = 0x2264;
/// greater-than or equal to ('≥')
static const int $ge       = 0x2265;
/// subset of ('⊂')
static const int $sub      = 0x2282;
/// superset of ('⊃')
static const int $sup      = 0x2283;
/// not a subset of ('⊄')
static const int $nsub     = 0x2284;
/// subset of or equal to ('⊆')
static const int $sube     = 0x2286;
/// superset of or equal to ('⊇')
static const int $supe     = 0x2287;
/// circled plus (direct sum) ('⊕')
static const int $oplus    = 0x2295;
/// circled times (vector product) ('⊗')
static const int $otimes   = 0x2297;
/// up tack (orthogonal to, perpendicular) ('⊥')
static const int $perp     = 0x22A5;
/// dot operator ('⋅')
static const int $sdot     = 0x22C5;
/// vertical ellipsis ('⋮')
static const int $vellip   = 0x22EE;
/// left ceiling (APL upstile) ('⌈')
static const int $lceil    = 0x2308;
/// right ceiling ('⌉')
static const int $rceil    = 0x2309;
/// left floor (APL downstile) ('⌊')
static const int $lfloor   = 0x230A;
/// right floor ('⌋')
static const int $rfloor   = 0x230B;
/// left-pointing angle bracket (bra) ('〈')
static const int $lang     = 0x2329;
/// right-pointing angle bracket (ket) ('〉')
static const int $rang     = 0x232A;
/// lozenge ('◊')
static const int $loz      = 0x25CA;
/// black spade suit ('♠')
static const int $spades   = 0x2660;
/// black club suit (shamrock) ('♣')
static const int $clubs    = 0x2663;
/// black heart suit (valentine) ('♥')
static const int $hearts   = 0x2665;
/// black diamond suit ('♦')
static const int $diams    = 0x2666;
