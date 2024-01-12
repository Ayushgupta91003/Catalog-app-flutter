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
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.theme.canvasColor,
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
                color: context.cardColor,
                child: Column(
                  children: [
                    catalog.name.toString().text.xl3.color(context.theme.secondaryHeaderColor).bold.make(), // toString.
                    catalog.desc.toString().text.xl.textStyle(context.captionStyle).make(),      // captionStyle makes light color.
                    "Lorem ipsum dolor sit amet ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in   velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.".
                    text.textStyle(context.captionStyle?.copyWith(fontSize:12)).make().p16(),

                  ],
                ).py32(),

              ),
            ))
          ],
        ),
      ),


      bottomNavigationBar:Container(
        color: context.theme.cardColor,          // for bottomnavigaton bar to be white
        child: ButtonBar(
          // buttonPadding: Vx.mOnly(right: 8),
          // buttonPadding: EdgeInsets.only(right: 8 ),
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${catalog.price}".toString().text.bold.xl4.red800.make(),
            10.heightBox,
            ElevatedButton(
              onPressed: (){},
              child: "Add to Cart".text.color(Colors.white).make(),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(context.theme.primaryColor),
                // shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                //   RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(5.0), // Set your desired radius here
                //   ),
                // ),
              ),

            ).wh(139,50),
                                      // .w20(context) se bhi button ki width badhayi jaa sakti thi.
          ],
        ).p32(),
      ),




    );
  }
}
