import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  final imageUrl = "https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  final imageUrl2 = "data:image/jpeg;base64,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";


  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,


      child: Container(

        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(

              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                decoration: BoxDecoration(
                  // color: Colors.red,

                ),

                accountName: Text("Ayush Gupta", style: TextStyle(fontWeight: FontWeight.w400),),
                accountEmail: Text("ayush91003@gmail.com",style: TextStyle(fontWeight: FontWeight.w400),),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),

                // iconTheme: IconThemeData(color: Colors.white),
                // currentAccountPictureSize: Size.fromHeight(20),
            )),


            ListTile(
              leading: Icon(CupertinoIcons.home, color: Colors.white,),
              title: Text("Home",
                  style : TextStyle(
                    color:Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  )
              ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.phone, color: Colors.white,),
              title: Text("About us", style : TextStyle(color:Colors.white, fontSize: 15,fontWeight: FontWeight.w400,)),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.mail, color: Colors.white,),
              title: Text("Email", style : TextStyle(color:Colors.white, fontSize: 15,fontWeight: FontWeight.w400,)),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.phone_circle, color: Colors.white,),
              title: Text("Support", style : TextStyle(color:Colors.white, fontSize: 15,fontWeight: FontWeight.w400,)),
            )
          ],
        ),
      ),
    );
  }
}
