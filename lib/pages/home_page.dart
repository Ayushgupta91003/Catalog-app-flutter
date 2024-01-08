import 'package:catalog/models/catalog.dart';
import 'package:catalog/widgets/drawer.dart';
import 'package:flutter/material.dart';

import '../widgets/item_widget.dart';
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

    final dummyList = List.generate(50, (index)=>CatalogModel.items[0]);

    return Scaffold(
      appBar: AppBar(

        // centerTitle: true,
        // iconTheme: IconThemeData(color: Colors.black),
        title: Text("Catalog App",
            // style:TextStyle(
            //   // color:Colors.black,
            //   fontWeight: FontWeight.w500,
            // ),
        ),


        // backgroundColor: Colors.white,
        // by default ye text ios me center aur android mein left side.
      ),
      body: Center(
        child: ListView.builder(
            itemCount: dummyList.length,
            itemBuilder: (context, index){
              return ItemWidget(
                item: dummyList[index],
              );
            }
        )
        // $ wala is called string interpolation

      ),
      drawer: MyDrawer(),
    );
  }
}
