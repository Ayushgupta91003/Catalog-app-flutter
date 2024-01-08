
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
    primarySwatch: Colors.deepPurple,
    fontFamily: GoogleFonts.lato().fontFamily,
    // iconTheme: IconThemeData(color: Colors.white),
    appBarTheme: AppBarTheme(

      // systemOverlayStyle: SystemUiOverlayStyle(
      //
      //   statusBarColor: Colors.black,
      // ),
      color: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      elevation: 0.0,
      centerTitle: true,
      titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
        fontFamily: GoogleFonts.lato().fontFamily,
        fontSize: 25,
        fontWeight: FontWeight.w600,
      ), // Remove the comma here
    ),
  );




  static ThemeData darkTheme(BuildContext context) => ThemeData(
    brightness: Brightness.dark,
  );
}
