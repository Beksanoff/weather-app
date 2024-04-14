import 'package:flutter/material.dart';

const primaryColor = Colors.lightBlue;
const containerColor = Color.fromRGBO(30, 136, 229, 1);

final themeData = ThemeData(
  primaryColor: primaryColor,
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontFamily: 'Montserrat_a',
      color: primaryColor,
    ),
    actionsIconTheme: IconThemeData(color: Colors.white),
    elevation: 0,
    backgroundColor: primaryColor,
  ),
  scaffoldBackgroundColor: Colors.lightBlue,
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: Colors.blue[100],
  ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryColor,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.blue[600],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 18,
      fontFamily: 'Montserrat_a',
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      fontSize: 15,
      fontFamily: 'Montserrat_a',
      color: Colors.white,
    ),
    displayLarge: TextStyle(
      fontSize: 100,
      fontFamily: 'Mark Pro',
      color: Colors.white,
    ),
    displayMedium: TextStyle(
      fontSize: 20,
      fontFamily: 'Montserrat_a',
      color: Colors.white,
    ),
    displaySmall: TextStyle(
      fontSize: 15,
      fontFamily: 'Montserrat_a',
      color: Colors.black,
    ),
  ),
);
