import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


Future<News> fetchNews() async {
  final response =
  await http.get(Uri.parse('https://api.first.org/data/v1/news'));

  if (response.statusCode == 200) {
    // print(News.fromJson(jsonDecode(response.body)));
    // print("hello world");
    return News.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class News {
  final List data;

  News({
    required this.data,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      data: json['data'] as List,
    );
  }
}

Future<Map<String, dynamic>> register (String email,String password ,String passwordConf) async{
  String url="https://nodejs-register-login-app.herokuapp.com";
  http.Response response = await http.post(
    Uri.parse(url),
    body: {'email': email,"username": "test", 'password': password, 'passwordConf':passwordConf},
  );
  Map<String, dynamic> json=jsonDecode(response.body);
  return json;
}
