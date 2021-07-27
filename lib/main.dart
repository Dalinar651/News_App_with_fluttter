
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screens/SignUpPage.dart';




void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // const MyloginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sign Up",
      home: SafeArea(
        child: signUpPage(),
      ),
    );
  }
}


