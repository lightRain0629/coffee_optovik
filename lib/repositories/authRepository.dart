import 'dart:convert';
import 'package:coffee_optovik/presentation/UI/mainPage.dart';
import 'package:flutter/material.dart';
import 'package:coffee_optovik/repositories/apiAdd.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../storage/storage.dart';

class AuthRepository {
  Future<dynamic> login(String name, String password, BuildContext context, bool rememberUser) async {
    print('loggg fun');
    String endpoint = '/api/v1/temp/auth';
    final data = {
      "username" : name,
      "password" : password
    };
        try {

      final response = await http.post(Uri.parse(Address().uri + endpoint),
          body: jsonEncode(data),
          headers: {
            'accept': 'application/json',
            'Content-Type': 'application/json'
          });
          print('sent');
      if (response.statusCode == 200) {
        print(200);
        var body = jsonDecode(response.body);
        final preferences = await SharedPreferences.getInstance();
        preferences.setBool('isLoggedIn', rememberUser);
        preferences.setString('token', body['token']);
        dynamic shortName = body['data']['shortName'];
        preferences.setString('shortName', shortName);
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MainPage()));
        Navigator.of(context).pushReplacementNamed('/mainPage');
        return body;
      } else if (response.statusCode == 400) {
        print(400);
        return 400;
      } else if (response.statusCode == 401) {
        print(401);
        return 401;
      } else if (response.statusCode == 429) {
        print(429);
        return 429;
      } else if (response.statusCode == 500) {
        // print(500);
        return 500;
      } else {
        print(response.body);
        print('write');
      }
    } catch (e) {
      print(e.toString());
      return Exception(e.toString());
    }
  }
}