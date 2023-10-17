import 'package:flutter/material.dart';
const Color  primaryColor =Colors.blue ;
const Color  accentColor =Colors.amber ;
ThemeData getThemeData()=>ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
  useMaterial3: true,
  primaryColor: Colors.white,
  primarySwatch:Colors.blue ,
  scaffoldBackgroundColor: const Color(0xFFE5EAF5),
  appBarTheme: const AppBarTheme(

      backgroundColor: primaryColor,
      centerTitle: true,
      titleTextStyle:TextStyle(
          fontSize: 26,
          color: Colors.white,
          fontFamily: 'ElMessiri',
          fontWeight: FontWeight.bold
      ),
      iconTheme: IconThemeData(
        color: Colors.white ,


      )
  ),
  iconTheme: const IconThemeData(
    color:accentColor,



  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFFE5EAF5),
    elevation: 2 ,
    selectedItemColor: primaryColor ,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: primaryColor,
    foregroundColor: Colors.white
  ),

  textTheme: const TextTheme(

    headlineLarge: TextStyle(
        fontSize: 26,
        color: Colors.white,
        fontFamily: 'ElMessiri',
        fontWeight: FontWeight.bold
    ),
    headlineMedium: TextStyle(
      fontSize: 24,
      color: primaryColor,
      fontFamily: 'ElMessiri',
      fontWeight: FontWeight.bold
    ),
    headlineSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
      fontFamily: 'ElMessiri',

    ),

    titleMedium: TextStyle(
      fontSize: 14,
      color: Colors.black,
      fontFamily: 'ElMessiri',

    ),
  ),


);

