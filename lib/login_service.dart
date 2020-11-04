import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginService {
  //static final baseUrl = "http://192.168.178.51:8080/api";
  static final baseUrl = "https://www.cimpl.credit/api";
  var url = "$baseUrl/auth";
  var headers = { "Content-Type": "application/json" };
  var token;

  static final LoginService _singleton = new LoginService._internal();

  factory LoginService() {
    return _singleton;
  }

  LoginService._internal();

  Future<bool> login(String username, String password) {
    return http.post(url, headers: headers, body: jsonEncode({"username": username, "password": password}))
        .then((response) {
          print(response.body);
          if (response.statusCode == 200) {
            token = jsonDecode(response.body)['token'];
            print(token);
            return true;
          } else {
            token = null;
            return false;
          }
        });
  }

  bool isLoggedIn() => token != null;
}