import 'package:flutter/material.dart';

class MarkeyMapTheme {
  static ThemeData theme = ThemeData(
    fontFamily: 'Gotham Narrow',
    accentColor: const Color(0xFFFF3333),
    appBarTheme: const AppBarTheme(
      elevation: 0,
    ),
    primaryColor: const Color(0xFF005196),
    scaffoldBackgroundColor: Colors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static const TextStyle appBarStyle = TextStyle(
    fontFamily: 'Gotham Narrow',
    fontWeight: FontWeight.w900,
    color: Colors.white,
    fontSize: 52,
    letterSpacing: 2,
    shadows: <Shadow>[
      Shadow(
        color: Color(0xFF005196),
        offset: Offset(0, 4),
        blurRadius: 2.0,
      ),
    ]
  );

  static const TextStyle searchBarStyle = TextStyle(
          fontStyle: FontStyle.italic,
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w200,
        );

  static const TextStyle welcomeHeaderStyle = TextStyle(
    color: Colors.white,
    fontFamily: 'Gotham Narrow',
    fontWeight: FontWeight.w900,
    fontSize: 96,
    fontStyle: FontStyle.italic,
    letterSpacing: 2,
    shadows: <Shadow>[
      Shadow(
        blurRadius: 2.0,
        color: Color(0xFF00044C),
        offset: Offset(4, 4),
      ),
    ],
  );

  static const TextStyle cardHeaderStyle = TextStyle(
    fontFamily: 'Gotham Narrow',
    fontSize: 64,
    fontWeight: FontWeight.w900,
    color: Colors.white,
    letterSpacing: 2,
    shadows: <Shadow>[
      Shadow(
        blurRadius: 2.0,
        color: Color(0xFF00044C),
        offset: Offset(0, 4),
      ),
    ],
  );

  static const TextStyle cardListStyle = TextStyle(
    fontSize: 20,
    color: Colors.white,
  );

  static const TextStyle buttonStyle = TextStyle(
    fontFamily: 'Gotham Narrow',
    color: Colors.white,
    fontSize: 20,
    shadows: <Shadow>[
      Shadow(
        offset: Offset(1, 1),
      ),
    ]
  );

  static const TextStyle funFactStyle = TextStyle(
    fontFamily: 'Gotham Narrow',
    color: Colors.black,
    fontSize: 24,
  );
}
