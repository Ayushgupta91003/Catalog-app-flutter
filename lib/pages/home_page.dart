import 'package:catalog/models/catalog.dart';
import 'package:catalog/widgets/drawer.dart';
import 'package:catalog/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';        // used in decoding
import '../widgets/item_widget.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

import 'home_widgets/catalog_header.dart';
import 'home_widgets/catalog_list.dart';




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
      backgroundColor: MyTheme.creamColor,
      body:SafeArea(
        child: Container(
          padding:Vx.m32,       // Edgeinsets.all 32.
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              CatalogHeader(),
              if(CatalogModel.items!=null && CatalogModel.items.isNotEmpty)
                CatalogList().expand()
              else
                CircularProgressIndicator().centered().py16().expand(),         // center mein laane ke liye.

            ],
          ),
        ),
      )
    );
  }
}





