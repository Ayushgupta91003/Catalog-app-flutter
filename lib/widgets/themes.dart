
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {

  static Color btnColor = lightBluishColor;
  static ThemeData lightTheme(BuildContext context) => ThemeData(



    primarySwatch: Colors.deepPurple,
    fontFamily: GoogleFonts.poppins().fontFamily,
    cardColor: Colors.white,
    canvasColor: creamColor,

    primaryColor: darkBluishColor,
    buttonTheme: ButtonThemeData(
      buttonColor: darkBluishColor,                              // sir ke mein direct ho jata hai. button theme use nahi karna padta.
    ),

    secondaryHeaderColor: darkBluishColor,                      // sir has used accent color



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
    fontFamily: GoogleFonts.poppins().fontFamily,
    cardColor: Colors.black,
    canvasColor: darkCreamColor,
    primaryColor: lightBluishColor,
    buttonTheme: ButtonThemeData(
      buttonColor: lightBluishColor,                              // sir ke mein direct ho jata hai. button theme use nahi karna padta.
    ),
    secondaryHeaderColor: Colors.white,


    // iconTheme: IconThemeData(color: Colors.white),
    appBarTheme: AppBarTheme(
      color: Colors.black,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      elevation: 0.0,
      centerTitle: true,
      titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
        fontFamily: GoogleFonts.lato().fontFamily,
        fontSize: 25,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ), // Remove the comma here                                             // sir ka nahi chal raha tha. toh heading 6 ka change kar diya. andar jaa jaa ke dekha 6 hr 20 mins.
    ),
  );


  static Color creamColor = Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray900;
  static Color darkBluishColor = Color(0xff403b58);
  static Color lightBluishColor = Vx.indigo500;



}








//
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:velocity_x/velocity_x.dart';
//
// class MyTheme {
//   // Access the context for brightness check
//   static late BuildContext context;
//
//   static Color get btnColor {
//     // Access the current theme using MediaQuery
//     Brightness currentBrightness = MediaQuery.platformBrightnessOf(context);
//
//     // Use a conditional statement to set btnColor based on the theme brightness
//     return currentBrightness == Brightness.light ? lightBluishColor : darkBluishColor;
//   }
//
//   static ThemeData lightTheme(BuildContext context) => ThemeData(
//     primarySwatch: Colors.deepPurple,
//     fontFamily: GoogleFonts.poppins().fontFamily,
//     cardColor: Colors.white,
//     canvasColor: creamColor,
//     buttonTheme: ButtonThemeData(
//       buttonColor: darkBluishColor,
//     ),
//     secondaryHeaderColor: darkBluishColor,
//     appBarTheme: AppBarTheme(
//       color: Colors.white,
//       iconTheme: IconThemeData(
//         color: Colors.black,
//       ),
//       elevation: 0.0,
//       centerTitle: true,
//       titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
//         fontFamily: GoogleFonts.lato().fontFamily,
//         fontSize: 25,
//         fontWeight: FontWeight.w600,
//       ),
//     ),
//   );
//
//   static ThemeData darkTheme(BuildContext context) => ThemeData(
//     brightness: Brightness.dark,
//     fontFamily: GoogleFonts.poppins().fontFamily,
//     cardColor: Colors.black,
//     canvasColor: darkCreamColor,
//     buttonTheme: ButtonThemeData(
//       buttonColor: lightBluishColor,
//     ),
//     secondaryHeaderColor: Colors.white,
//     appBarTheme: AppBarTheme(
//       color: Colors.black,
//       iconTheme: IconThemeData(
//         color: Colors.black,
//       ),
//       elevation: 0.0,
//       centerTitle: true,
//       titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
//         fontFamily: GoogleFonts.lato().fontFamily,
//         fontSize: 25,
//         fontWeight: FontWeight.w600,
//       ),
//     ),
//   );
//
//   static Color creamColor = Color(0xfff5f5f5);
//   static Color darkCreamColor = Vx.gray900;
//   static Color darkBluishColor = Color(0xff403b58);
//   static Color lightBluishColor = Vx.indigo500;
// }
