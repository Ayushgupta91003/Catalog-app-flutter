import 'package:catalog/routes/routes.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String name = "";
  bool changeButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.deepPurple,
      //   elevation: 10,
      //   shadowColor: Colors.black,
      //   title: Center(
      //     child: Text("Login Page",
      //       // textAlign: TextAlign.center,
      //       style: TextStyle(fontWeight: FontWeight.bold,
      //       fontSize: 25,
      //
      //     ),
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/login.png",
              fit: BoxFit.cover,
              // width: 150,
              height: 200,
              // alignment: Alignment.center,
            ),

            SizedBox(
              height: 20,
            ),

            Text("Welcome $name",
              style: TextStyle(
                // fontWeight: FontWeight.w500,
                fontSize: 28,
                // fontFamily: GoogleFonts.solway().fontFamily,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Username",
                      labelText: "Username",

                    ),
                    onChanged: (value) {
                      name = value;
                      setState(() {

                      });
                    },
                  ),

                  TextFormField(
                    obscureText: true,
                    // obscuringCharacter: '8',
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      label: Text("Password"),

                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 40,

            ),

            InkWell(

              onTap:() async {

                setState(() {
                  changeButton= true;
                });
                await Future.delayed(Duration(seconds: 2));
                Navigator.pushNamed(context, MyRoutes.homeRoute);
              },
              // didn't showed animations correctly hence gpt code below

              // // gpt
              // onTap: () {
              //   setState(() {
              //     changeButton = true;
              //   });
              //
              //   Future.delayed(Duration(seconds: 2), () {
              //     Navigator.pushNamed(context, MyRoutes.homeRoute).then((_) {
              //       setState(() {
              //         changeButton = false;
              //       });
              //     });
              //   });
              // },
              //
              // // gpt close

              child: AnimatedContainer(
                duration: Duration(seconds: 2),
                width: changeButton?50: 150,
                height:50,
                // color:Colors.deepPurple,
                alignment: Alignment.center,
                child: changeButton?Icon(Icons.done, color: Colors.white,) : Text(
                    "Login",
                    style:TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,

                ),
                ),


                decoration: BoxDecoration(
                  color: changeButton?Colors.red: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(changeButton?50:8),
                  // border radius occur smoothly.
                  // shape: changeButton? BoxShape.circle: BoxShape.rectangle,

                ),
              ),
            ),



            // ElevatedButton(
            //   onPressed: () {
            //     // print("Button Pressed");
            //     // Navigator.push(context, ...)
            //     Navigator.pushNamed(context, MyRoutes.homeRoute);
            //   },
            //   style: ElevatedButton.styleFrom(
            //     minimumSize: Size(150, 45),
            //     maximumSize: Size(150, 60),
            //     backgroundColor: Colors.deepPurple,
            //     // shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
            //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
            //   ),
            //   child: Text(
            //     "Login",
            //     style: TextStyle(
            //       color: Colors.white,
            //     ),
            //   ),
            // )


          ],
        ),
      ),


    );
  }
}
