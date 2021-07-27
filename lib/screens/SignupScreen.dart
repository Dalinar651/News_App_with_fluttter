import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:rest_api_login/providers/auth.dart';
// import 'package:rest_api_login/screens/home_Screen.dart';
// import 'package:rest_api_login/screens/login_Screen.dart';
// import 'package:rest_api_login/utils/http_exception.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  Map<String, String> _authData = {'email': '', 'password': ''};
  TextEditingController _passwordController = new TextEditingController();

  Future<Map<String, dynamic>> _register (String email,String password ,String passwordConf) async{
    String url="https://nodejs-register-login-app.herokuapp.com";
    http.Response response = await http.post(
      Uri.parse(url),
      body: {'email': email,"username": "test", 'password': password, 'passwordConf':passwordConf},
    );
    Map<String, dynamic> json=jsonDecode(response.body);
    print(json["success"]);
    return json;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.65,
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(360),
                        bottomRight: Radius.circular(360)),
                    color: Colors.blue),
              ),
              Container(
                padding:
                EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 40),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Sign up with username or email",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 10),
                    ),
                    Form(
                      key: _formKey,
                      child: Container(
                        padding: EdgeInsets.only(top: 50, left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Username or Email",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                            TextFormField(
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                  )),
                              validator: (value) {
                                if (value!.isEmpty || !value.contains('@')) {
                                  return 'Invalid email';
                                }
                              },
                              onSaved: (value) {
                                _authData['email'] = value!;
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Password",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                            TextFormField(
                              obscureText: true,
                              controller: _passwordController,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.vpn_key,
                                    color: Colors.white,
                                  )),
                              validator: (value) {
                                if (value!.isEmpty || value.length < 5) {
                                  return 'Password is to Short';
                                }
                              },
                              onSaved: (value) {
                                _authData['password'] = value!;
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Confirm Password",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                            TextFormField(
                              obscureText: true,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.vpn_key,
                                    color: Colors.white,
                                  )),
                              validator: (value) {
                                if (value != _passwordController.text) {
                                  return 'Password doesnot match';
                                }
                              },
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 40),
                              width: 140,
                              child: ElevatedButton(
                                  onPressed: () {
                                    _register(_authData["email"]!, _authData["password"]!, _authData["password"]!);
                                  },
                                  // shape: RoundedRectangleBorder(
                                  //   borderRadius:
                                  //   new BorderRadius.circular(10.0),
                                  // ),
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  // color: Colors.green
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              // child: InkWell(
                              //   onTap: () {
                              //     Navigator.of(context).push(MaterialPageRoute(
                              //         builder: (ctx) => LoginScreen()));
                              //   },
                              //   child: Container(
                              //     padding: EdgeInsets.only(top: 90),
                              //     child: Text(
                              //       "Sign In",
                              //       style: TextStyle(
                              //           decoration: TextDecoration.underline,
                              //           color: Colors.blue,
                              //           fontSize: 16),
                              //     ),
                              //   ),
                              // ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showerrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          'An Error Occurs',
          style: TextStyle(color: Colors.blue),
        ),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
