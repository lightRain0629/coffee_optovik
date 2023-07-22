import 'dart:convert';

import 'package:http/http.dart' as http ;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/customersHistoryModel.dart';
import 'apiAdd.dart';

class CustomersHistoryRepository {
    Future<List<CustomersHistoryModel>> getCustomers(int customersId, String date, ) async {
    final preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    print(date.toString());
    String endpoint = '/api/v1/temp/customers/payments?dateFrom=$date&customerId=$customersId';
    final response = await http.get(Uri.parse(Address().uri + endpoint),
        headers: {
          "accept": "application/json",
          "Authorization": "Bearer $token"
        });
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      print(body);
      return body.map<CustomersHistoryModel>(CustomersHistoryModel.fromJson).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}