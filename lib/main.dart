
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_flutter/auth.dart';
import 'screens/SignUpPage.dart';
// import 'auth.dart';
// import 'screens/newsPage.dart';




void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // const MyloginPage({Key key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState(){
    super.initState();
    DateTime now=DateTime.now();
    initilize().then((value){
      setState(() {
        prefs=value;

        if(prefs!.getInt('time_min')!=null){
          if( now.minute.toInt()- prefs!.getInt('time_min')! >11  ){
            prefs!.setBool('login', false);
          }else if( now.hour!=prefs!.getInt('time_hour')){
            prefs!.setBool('login', false);
          }
        }
       prefs!.setInt('time_min', now.minute);
       prefs!.setInt('time_hour', now.hour);
        // now.
      });
    });


  }
  @override
  void dispose(){
    super.dispose();

  }
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


