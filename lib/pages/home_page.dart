import 'package:catalog/models/catalog.dart';
import 'package:catalog/widgets/drawer.dart';
import 'package:catalog/widgets/themes.dart';
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



class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        "Catalog App".text.xl5.bold.color(MyTheme.darkBluishColor).make(),
        "Trending Products".text.xl2.make(),

      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,       // for expanded use.
      itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
          return CatalogItem(catalog: catalog);
        },


    );
  }
}



class CatalogItem extends StatelessWidget {

  final Item catalog;

  const CatalogItem({super.key, required this.catalog});
  // const CatalogItem({super.key});
  // const CatalogItem({Key? key, required this.catalog}) :
  //       assert(catalog!=null),
  //       super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
            CatalogImage(image: catalog.image.toString()),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.toString().text.color(MyTheme.darkBluishColor).lg.bold.make(), // toString.
              catalog.desc.toString().text.textStyle(context.captionStyle).make(),      // captionStyle makes light color.                     // tostring
              ButtonBar(
                // buttonPadding: Vx.mOnly(right: 8),
                // buttonPadding: EdgeInsets.only(right: 8 ),
                alignment: MainAxisAlignment.spaceBetween,
                children: [
                  "\$${catalog.price}".toString().text.bold.xl.make(),

                  10.heightBox,

                  ElevatedButton(
                    onPressed: (){},
                    child: "Buy".text.color(Colors.white).make(),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(MyTheme.darkBluishColor),
                      // shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      //   RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(5.0), // Set your desired radius here
                      //   ),
                      // ),
                    ),

                  )
                ],
              ).pOnly(right: 8.0),
            ],
          ))
          ],
      )
    ).white.rounded.square(150).make().py16();      // py matlab vertical padding(up and down)
  }
}



class CatalogImage extends StatelessWidget {

  final String image;
  const CatalogImage({super.key, required this.image});


  @override
  Widget build(BuildContext context) {
    return Image.network(
        image,
    ).box.rounded.p8.color(MyTheme.creamColor).make().p16().w40(context)
    ;
  }
}
