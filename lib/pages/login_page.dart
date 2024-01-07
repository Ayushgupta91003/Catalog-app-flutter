import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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

              // alignment: Alignment.center,
            ),
            SizedBox(height: 20,),

            Text("Welcome",
              style: TextStyle(
                // fontWeight: FontWeight.w500,
                fontSize: 35,
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
              height: 20,

            ),

            ElevatedButton(


            onPressed:() {
              print("Button Pressed");
              // Navigator.push(context, )


            },
              style: TextButton.styleFrom(backgroundColor: Colors.deepPurple,
                // backgroundColor: ,
              ),
              child: Text("Login",
              style: TextStyle(

                color: Colors.white,
              ),),

            )




          ],
        ),
      ),


    );
  }
}
