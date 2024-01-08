import 'package:catalog/widgets/drawer.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
class HomePage extends StatelessWidget {
  // const HomePage({super.key});
  // double, bool
  final int days = 30;
  final String name = "codepur";
  // num can take both int and double.
  // var can take all
  // var day:String = "Tues";     // ek tareeka hai.
  // const pi = 3.14;
  // final k = 10;
  // final ke listt mein addition kar sakte hai lekin const mein nahi kar saktte.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Catalog App",
            style:TextStyle(
              color:Colors.white,
              fontWeight: FontWeight.w500,

            ),
        ),


        backgroundColor: Colors.deepPurple,
        // by default ye text ios me center aur android mein left side.
      ),
      body: Center(
        child: Container(child: Text("Welcome to the ${days} days of flutter by $name")),
        // $ wala is called string interpolation

      ),
      drawer: MyDrawer(),
    );
  }
}
