import 'package:flutter/material.dart';

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
        title: Text("Catalog App"),
        backgroundColor: Colors.green,
        // by default ye text ios me center aur android mein left side.
      ),
      body: Center(
        child: Container(child: Text("Welcome to the ${days} days of flutter by $name")),
        // $ wala is called string interpolation

      ),
      drawer: Drawer(),
    );
  }
}
