import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppTheme{

  static ThemeData lightTheme(){
    return ThemeData(
      fontFamily: GoogleFonts.poppins().fontFamily,
      textTheme: TextTheme(
          headlineLarge: TextStyle(
              fontSize: 43,
              color: Colors.black
          ),
          bodyMedium: TextStyle(
              fontSize: 25,
              color: Colors.black
          ),
          labelMedium: TextStyle(
              fontSize: 16,
              color: Colors.black
          )
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11),
          ),
          backgroundColor: Colors.black,
        ),
      ),
      backgroundColor: Colors.white,
      brightness: Brightness.light,
      primarySwatch: Colors.blue,
    );
  }

  static ThemeData darkTheme(){
    return ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        textTheme: TextTheme(
            headlineLarge: TextStyle(
                fontSize: 43,
                color: Colors.white
            ),
            bodyMedium: TextStyle(
                fontSize: 25,
                color: Colors.white
            ),
            labelMedium: TextStyle(
                fontSize: 16,
                color: Colors.white
            )
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(34),
            ),
            backgroundColor: Colors.white,
          ),
        ),
        brightness: Brightness.dark);
  }

  MyAppTheme();
}