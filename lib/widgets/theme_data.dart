import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  fontFamily: 'Quicksand',
  textTheme: ThemeData.light().textTheme.copyWith(
        headline6: const TextStyle(
          fontFamily: 'Opensans',
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        button: const TextStyle(
          color: Colors.white,
        ),
      ),
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      fontFamily: 'Opensans',
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
  primarySwatch: Colors.deepPurple,
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple)
      .copyWith(secondary: Colors.amber),
);
