import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_flutter/auth.dart';
import 'dart:ui';

import 'package:task_flutter/screens/LoginPage.dart';
import '../utils/utils_functions.dart';

class signUpPage extends StatefulWidget {
  // const MyApp({Key? key}) : super(key: key);
  @override
  _signUpPageState createState() => _signUpPageState();
}

class _signUpPageState extends State<signUpPage> {
  bool flag = false;
  final TextEditingController _email=TextEditingController();
  final TextEditingController _password=TextEditingController();
  final TextEditingController _pass_conf=TextEditingController();

  void checkPage() {
    setState(() {
      flag = !flag;
    });
  }

  void registerWithEmail() {

      register(_email.text, _password.text, _pass_conf.text).then((value) {
        if(value['Success']=='Success!'){
          setState(() {
            authentication=true;
          });
        }else{
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value['Success'])));
        }
      });
    }

  @override
  Widget build(BuildContext context) {
    if (!flag) {
      return loginPage();
    }
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://thumbs.dreamstime.com/z/asian-food-two-poke-bowl-fried-rice-chicken-fillet-eggs-top-view-concept-132116776.jpg"),
                fit: BoxFit.cover),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
        Column(children: [
          Expanded(
            flex: 4,
            child: Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 40.0),
              child: Text(
                "Welcome !!",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 26.0),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
              ),
              child: ListView(
//                         crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(vertical: 20.0),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.blue[900],
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      margin: EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 10.0),
                      height: 40.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.grey[100]),
                      child: TextField(
                        controller: _email,
                        decoration: InputDecoration(
//                   border: null,
                          hintText: 'Email:',
//                     hintText: 'Enter Your password',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      margin: EdgeInsets.symmetric(horizontal: 30.0),
                      height: 40.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.grey[100]),
                      child: TextField(
                        controller: _password,
                        decoration: InputDecoration(
//                   border: null,
                          hintText: 'Password:',
//                     hintText: 'Enter Your password',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      margin: EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 10.0),
                      height: 40.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.grey[100]),
                      child: TextField(
                        controller: _pass_conf,
                        decoration: InputDecoration(
//                   border: null,
                          hintText: 'Re-Enter Password:',
//                     hintText: 'Enter Your password',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 10.0),
                      height: 40.0,
                      child: Center(
                        child: TextButton(
                          onPressed: registerWithEmail,
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xff0FAAE2),
                          borderRadius: BorderRadius.circular(50.0)),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Expanded(
                          child: Divider(
                        color: Colors.grey[400],
                      )),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text("or Sign up with",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Expanded(
                          child: Divider(
                        color: Colors.grey[400],
                      )),
                    ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 15.0),
                            height: 30.0,
                            width: 30.0,
                            child: Image.network(
                                'https://th.bing.com/th/id/OIP.CaO7g0KeDbc8BhMclMbeXgHaHa?w=178&h=180&c=7&o=5&dpr=1.25&pid=1.7',
                                fit: BoxFit.cover)),
                        Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 15.0),
                            height: 30.0,
                            width: 30.0,
                            child: Image.network(
                                'https://th.bing.com/th?q=Facebook+Logo+Blue&w=120&h=120&c=1&rs=1&qlt=90&cb=1&dpr=1.25&pid=InlineBlock&mkt=en-IN&adlt=moderate&t=1&mw=247',
                                fit: BoxFit.cover))
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                               SizedBox(
//                               height:10.0
//                               ),
                      Text("have an account?"),
                      TextButton(
                          onPressed: checkPage,
                          child: Text(
                            "Sign in",
                            style: TextStyle(color: Colors.orangeAccent),
                          )),
                    ]),
                  ]),
            ),
          ),
        ]),
      ],
    );
  }
}
