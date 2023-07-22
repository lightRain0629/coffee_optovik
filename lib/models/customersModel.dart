import 'package:meta/meta.dart';
import 'dart:convert';

class CustomersModel {
  int id;
  String name;
  num balance;
  String currencyName;

  CustomersModel({
    required this.id,
    required this.name,
    required this.balance,
    required this.currencyName,
  });

  static CustomersModel fromJson(json) => CustomersModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'name',
      balance: json['balance'] ?? 0,
      currencyName: json['currencyName'] ?? 'currencyName');
}
