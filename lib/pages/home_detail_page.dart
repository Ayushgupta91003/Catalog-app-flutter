import 'package:catalog/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({super.key, required this.catalog});
  // const HomeDetailPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      backgroundColor: MyTheme.creamColor,
      body:SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
                child: Image.network(catalog.image.toString()),
              tag: Key(catalog.id.toString()),
            ).h32(context),     // to set the height instead of padding.

            Expanded(child: VxArc(
              height:20,
              arcType: VxArcType.convey,
              edge: VxEdge.top,
              child: Container(
                width: context.screenWidth,       // velocity x feature.
                color: Colors.white,
                child: Column(
                  children: [
                    catalog.name.toString().text.xl3.color(Colors.black).bold.make(), // toString.
                    catalog.desc.toString().text.xl.textStyle(context.captionStyle).make(),      // captionStyle makes light color.

                  ],
                ).py32(),

              ),
            ))
          ],
        ),
      ),


      bottomNavigationBar:Container(
        color: Colors.white,          // for bottomnavigaton bar to be white
        child: ButtonBar(
          // buttonPadding: Vx.mOnly(right: 8),
          // buttonPadding: EdgeInsets.only(right: 8 ),
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${catalog.price}".toString().text.bold.xl4.red800.make(),

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

            ).wh(100,50),
                                      // .w20(context) se bhi button ki width badhayi jaa sakti thi.
          ],
        ).p32(),
      ),




    );
  }
}
