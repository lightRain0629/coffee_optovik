import 'dart:convert';

import 'package:coffee_optovik/repositories/apiAdd.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/customersModel.dart';

class CustomersRepository {
  Future<List<CustomersModel>> getCustomers() async {
    final preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    String endpoint = '/api/v1/temp/customers?limit=10&offset=0';
    final response = await http.get(Uri.parse(Address().uri + endpoint),
        headers: {
          "accept": "application/json",
          "Authorization": "Bearer $token"
        });
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      print(body);
      return body.map<CustomersModel>(CustomersModel.fromJson).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
