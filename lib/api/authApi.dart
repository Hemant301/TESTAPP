import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthApi {
  Future<dynamic> doLogin(String type, String fName, String lName, String email,
      String country, String mobile, String password) async {
    var client = http.Client();
    try {
      final body = {
        "type": type,
        "firstname": fName,
        "lastname": lName,
        "email": email,
        'country': country,
        "mobile": mobile,
        "password": password
      };
      debugPrint("body : $body");

      final response = await client.post(
          Uri.parse("https://vibrobike.solutiontrackers.biz/api/signUpDemo"),
          body: jsonEncode(body),
          headers: {"Content-Type": "application/json"});

      if (response.statusCode == 200 || response.statusCode == 400) {
        print(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        debugPrint('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      //// print\(e\);
    } finally {
      client.close();
    }
  }
}

final authApi = AuthApi();
