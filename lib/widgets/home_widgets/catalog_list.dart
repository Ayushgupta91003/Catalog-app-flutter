import 'package:catalog/models/cart.dart';
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
        final catalog = CatalogModel.items[index];
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





class CatalogItem extends StatefulWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog});

  @override
  State<CatalogItem> createState() => _CatalogItemState();
}

class _CatalogItemState extends State<CatalogItem> {
  bool isPressed = false;

  // const CatalogItem({super.key});
  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
          children: [
            Hero(
              tag: Key(widget.catalog.id.toString()),            // agar iss child ko hero se wrap kiya toh jaha main image hai usko bhi karna padega.
                child: CatalogImage(image: widget.catalog.image.toString())

            ),


            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.catalog.name.toString().text.color(context.theme.secondaryHeaderColor).xl.bold.make(), // toString.
                widget.catalog.desc.toString().text.textStyle(context.captionStyle).make(),      // captionStyle makes light color.                     // tostring
                // 10.heightBox,
                ButtonBar(
                  // buttonPadding: Vx.mOnly(right: 8),
                  // buttonPadding: EdgeInsets.only(right: 8 ),
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "\$${widget.catalog.price}".toString().text.bold.xl.make(),

                    // 10.heightBox,
                    _AddToCart(catalog: widget.catalog),
                    // ElevatedButton(
                    //   onPressed: (){
                    //     isPressed = true;
                    //
                    //   },
                    //   child: "Add to Cart".text.textStyle(context.captionStyle).color(Colors.white).make(),
                    //   style: ButtonStyle(
                    //     backgroundColor: MaterialStateProperty.all<Color>(
                    //         context.theme.primaryColor,
                    //     ),
                    //     // shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    //     //   RoundedRectangleBorder(
                    //     //     borderRadius: BorderRadius.circular(5.0), // Set your desired radius here
                    //     //   ),
                    //     // ),
                    //   ),
                    //
                    // )
                  ],
                ).pOnly(right: 0.0),
              ],
            ))
          ],
        )
    ).color(context.cardColor).rounded.square(150).make().py16();      // py matlab vertical padding(up and down)
  }
}



class _AddToCart extends StatefulWidget {
  final Item catalog;
  const _AddToCart({super.key, required this.catalog});

  @override
  State<_AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<_AddToCart> {

  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        final _catalog = CatalogModel();
        final _cart = CartModel();
        _cart.catalog = _catalog;
        _cart.add(widget.catalog);
        setState(() {
        isAdded = isAdded.toggle();


        });

      },
      child: isAdded? Icon(Icons.done, color: Colors.white,): "Add to Cart".text.textStyle(context.captionStyle).color(Colors.white).make(),
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

    );
  }
}

