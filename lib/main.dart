
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:task_flutter/screens/SignupScreen.dart';
import 'package:task_flutter/screens/newsPage.dart';
import 'utils/utils_functions.dart';
import 'dart:async';





void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // const MyloginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sign Up",
      home: SafeArea(
        child: SignUpScreen(),
      ),
    );
  }
}


