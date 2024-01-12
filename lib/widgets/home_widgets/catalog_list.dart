import 'package:catalog/pages/home_detail_page.dart';
import 'package:catalog/routes/routes.dart';
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
        final catalog = CatalogModel.getByPosition(index);
        return InkWell(
          onTap: (){
            // Navigator.pushNamed(context, MyRoutes.homeDetailsRoute);    // not used in this scenario. ass we want to pass arguments also.
            Navigator.push(context,MaterialPageRoute(builder: (context)=>HomeDetailPage(catalog: catalog)));
            
          },
            child: CatalogItem(catalog: catalog)

        );
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
            Hero(
              tag: Key(catalog.id.toString()),            // agar iss child ko hero se wrap kiya toh jaha main image hai usko bhi karna padega.
                child: CatalogImage(image: catalog.image.toString())

            ),


            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.toString().text.color(context.theme.secondaryHeaderColor).xl.bold.make(), // toString.
                catalog.desc.toString().text.textStyle(context.captionStyle).make(),      // captionStyle makes light color.                     // tostring
                // 10.heightBox,
                ButtonBar(
                  // buttonPadding: Vx.mOnly(right: 8),
                  // buttonPadding: EdgeInsets.only(right: 8 ),
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "\$${catalog.price}".toString().text.bold.xl.make(),

                    // 10.heightBox,

                    ElevatedButton(
                      onPressed: (){},
                      child: "Add to Cart".text.textStyle(context.captionStyle).color(Colors.white).make(),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            context.theme.primaryColor,
                        ),
                        // shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        //   RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(5.0), // Set your desired radius here
                        //   ),
                        // ),
                      ),

                    )
                  ],
                ).pOnly(right: 0.0),
              ],
            ))
          ],
        )
    ).color(context.cardColor).rounded.square(150).make().py16();      // py matlab vertical padding(up and down)
  }
}
