import 'package:flutter/material.dart';

class LandingStyles {
  static final ButtonStyle buttonStyle =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

  static const headerStyle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const subHeaderStyle = TextStyle(
    fontSize: 18,
    color: Colors.white70,
  );

  static var textDetailsStyle =
      TextStyle(fontSize: 20, color: Colors.blue[600]);
}
