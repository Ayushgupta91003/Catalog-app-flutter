import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,

        title: Center(child: Text("Login Page",
          style: TextStyle(
              color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),
        )
        ),
      ),


    );
  }
}
