import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.blue,
  primaryColor: Colors.white,
  primaryColorDark: Colors.white,
  primaryColorLight: Colors.black,
  scaffoldBackgroundColor: Colors.white,
  brightness: Brightness.light,
  disabledColor: Colors.grey.shade200,
  highlightColor: Colors.white,
  hintColor: Colors.white,
  splashColor: Colors.white,
  iconTheme: const IconThemeData(
    color: Colors.black,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 16,
      color: Colors.black,
      fontFamily: "Montserrat",
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      color: Colors.black,
      fontFamily: "DMSans",
      fontWeight: FontWeight.w600,
    ),
    bodySmall: TextStyle(
      fontSize: 18,
      color: Colors.grey,
      fontFamily: "DMSans",
      fontWeight: FontWeight.w600,
    ),
    displayLarge: TextStyle(
      fontSize: 24,
      color: Colors.black,
      fontFamily: "DMSans",
      fontWeight: FontWeight.w600,
    ),
    titleMedium: TextStyle(
      fontSize: 14,
      color: Colors.black,
      fontFamily: "DMSans",
      fontWeight: FontWeight.w600,
    ),
    titleSmall: TextStyle(
      fontSize: 20,
      color: Colors.black,
      fontFamily: "DMSans",
      fontWeight: FontWeight.w600,
    ),
  ),
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      fontSize: 16,
      color: Colors.black,
      fontFamily: "DMSans",
      fontWeight: FontWeight.w600,
    ),
    elevation: 1,
    iconTheme: IconThemeData(color: Colors.black),
    backgroundColor: Colors.white,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.blue,
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
  primaryColor: Colors.black,
  primaryColorDark: Colors.black,
  primaryColorLight: Colors.white,
  scaffoldBackgroundColor: Colors.black,
  disabledColor: Colors.grey,
  brightness: Brightness.dark,
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
  hintColor: Colors.transparent,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 16,
      color: Colors.white,
      fontFamily: "Montserrat",
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      color: Colors.white,
      fontFamily: "DMSans",
      fontWeight: FontWeight.w600,
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
    ),
  ),
);
