import 'package:flutter/material.dart';
import '../../models/catalog.dart';
import '../../widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'catalog_image.dart';


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
