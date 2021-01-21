import 'package:flutter/material.dart';

final kHintTextStyle = TextStyle(
  color: Color(0xFF663203),
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Color(0xFF663203),
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFFe8e8e8),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 0),
    ),
  ],
);

class Dark{
  static const Color textColor = Color(0xFF663203);
  static const Color activeColor = Color(0xFF9c6a07);
}