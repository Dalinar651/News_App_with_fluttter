
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screens/SignUpPage.dart';
import 'auth.dart';
import 'screens/newsPage.dart';




void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // const MyloginPage({Key key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sign Up",
      home: SafeArea(
        child: Scaffold(
          body: signUpPage(),
        ),
      ),
    );
  }
}


