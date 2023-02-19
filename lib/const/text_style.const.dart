import 'package:flutter/material.dart';

const kHintTextStyle = TextStyle(
  color: Colors.white60,
  fontFamily: 'Mukta',
  fontSize: 18.0,
);

const kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'Mukta',
  fontSize: 18.0,
);

const kStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'Mukta',
  fontSize: 18.0,
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color.fromARGB(255, 128, 179, 241),
  // color: Colors.white,
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);
