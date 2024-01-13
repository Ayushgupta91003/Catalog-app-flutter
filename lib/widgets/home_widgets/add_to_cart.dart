
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/cart.dart';
import '../../models/catalog.dart';

class AddToCart extends StatefulWidget {
  final Item catalog;
  const AddToCart({super.key, required this.catalog});

  @override
  State<AddToCart> createState() => AddToCartState();
}

class AddToCartState extends State<AddToCart> {
  final _catalog = CatalogModel();

  final _cart = CartModel();
  bool isInCart = false;

  @override
  Widget build(BuildContext context) {

    bool isInCart = _cart.items.contains(widget.catalog) ?? false;

    return ElevatedButton(
      onPressed: (){

        if(!isInCart) {
          isInCart = isInCart.toggle();

          _cart.add(widget.catalog);
          _cart.catalog = _catalog;
          setState(() {


          });
        }

      },
      child: isInCart?
      Icon(Icons.done, color: Colors.white,)
          : Icon(CupertinoIcons.cart_badge_plus, color:Colors.white),
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

