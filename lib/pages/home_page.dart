import 'package:catalog/models/catalog.dart';
import 'package:catalog/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';        // used in decoding
import '../widgets/item_widget.dart';
// import 'package:google_fonts/google_fonts.dart';

import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // const HomePage({super.key});
  final int days = 30;

  final String name = "codepur";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async{
    await Future.delayed(Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    // print(catalogJson);
    final decodeData = jsonDecode(catalogJson);
    var productsData = decodeData["products"];
    // print(productsData);

    // List<Item> list = List.from(productsData).map((e) => null).toList();
    // List<Item> list = List.from(productsData.map((e) => Item.fromJson(e))).toList();
    // List<Item> list = List<Item>.from(productsData.map((e) => Item.fromMap(e))).toList();   // sir ka nahi chal raha tha.
    CatalogModel.items = List.from(productsData).map<Item>((item)=>Item.fromMap(item)).toList();
    setState(() {
      // data change ho raha hai. kyuki items mein ek hi item hai. isiliye setState call karna padta hai.

    });
  }

  // num can take both int and double.
  @override
  Widget build(BuildContext context) {

    // final dummyList = List.generate(50, (index)=>CatalogModel.items[0]);

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

        child: Container(
          color: Colors.white,
          child:(CatalogModel.items!=null && CatalogModel.items.isNotEmpty)?

          // ListView.builder(
          //     itemCount: CatalogModel.items.length,
          //     itemBuilder: (context, index){
          //       return ItemWidget(
          //         item: CatalogModel.items[index],
          //       );
          //     }
          // ):
          GridView.builder(

            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 10,

            ),
            itemBuilder: (context,index){
              final item = CatalogModel.items[index];
              // return GridTile(
              //     child: Image.network(item.image.toString()));


              return Card(
                clipBehavior: Clip.antiAlias,
                elevation: 5.0,
                shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: GridTile(
              header: Container(
              child: Text(
              item.name.toString(),
              style: TextStyle(color: Colors.white),
              ),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                ),
              ),
                  // footer: Text(item.price.toString()),

                  footer: Container(
                    child: Text(
                      item.price.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                  ),
                  child: item.image != null
                      ? Image.network(item.image!)
                      : CircularProgressIndicator(), // or any placeholder widget
                ),
              );



            },
            itemCount:CatalogModel.items.length,)
          :
          Center(
            child: CircularProgressIndicator(),
          )
          ,
        )
        // $ wala is called string interpolation

      ),
      drawer: MyDrawer(),
    );
  }
}
