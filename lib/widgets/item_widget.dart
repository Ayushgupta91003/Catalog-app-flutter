// import 'package:flutter/material.dart';
//
// import '../models/catalog.dart';
//
// class ItemWidget extends StatelessWidget {
//   // const ItemWidget({super.key});
//   final Item item;
//
//   // const ItemWidget({super.key, required this.item});
//   const ItemWidget({Key key, @required this.item})
//       : assert(item != null),
//         super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }



import 'package:flutter/material.dart';

import '../models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item}) : assert(item != null),super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Card(
        shape: StadiumBorder(),
        color:Colors.white,
        elevation: 0.5,
        child: ListTile(
          // style: ,
          onTap: (){
            print("${item.name} Pressed");
          },
          leading: Image.network(item.image),
          title: Text(item.name),
          subtitle: Text(item.desc),
          trailing: Text("\$${item.price.toString()}",

          style: TextStyle(
            fontWeight: FontWeight.bold,
            color:Colors.deepPurple,
            fontSize: 17,
          ),),

        ),
      ),
    );
  }
}
