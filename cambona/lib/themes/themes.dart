import 'package:flutter/material.dart';

final primaryColor = Colors.blueGrey[900]!;
const secundaryColor = Colors.white;

final appTheme = ThemeData(
  //ESQUEMA DE CORES
  primaryColor: primaryColor,

  scaffoldBackgroundColor: primaryColor,

  //Scaffold backgroud color
  backgroundColor: primaryColor,

  //APPBAR
  appBarTheme: AppBarTheme(
    elevation: 0,
    backgroundColor: primaryColor,
    iconTheme: IconThemeData(
      color: primaryColor,
    ),
  ),

  //ELEVATED BUTTOM
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: primaryColor,
      textStyle: const TextStyle(
        fontFamily: 'Roboto',
        fontSize: 16,
      ),
    ),
  ),

  //Icon
  iconTheme: const IconThemeData(
    color: secundaryColor,
  ),

  //TEXTOS
  textTheme: const TextTheme(
    labelMedium: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 16,
      //fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    titleLarge: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 30,
      color: secundaryColor,
    ),
  ),

  //INPUT DECORATION THEME
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: primaryColor,
        width: 0.0,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(5),
      ),
    ),
    labelStyle: const TextStyle(
      fontFamily: 'Roboto',
      fontSize: 14,
      color: secundaryColor,
    ),
    iconColor: primaryColor,
    prefixIconColor: primaryColor,
    suffixIconColor: secundaryColor,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: primaryColor, width: 0.0),
      borderRadius: const BorderRadius.all(
        Radius.circular(5),
      ),
    ),
  ),
);
