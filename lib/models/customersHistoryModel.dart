import 'dart:convert';

class CustomersHistoryModel {
  String payDate;
  String bankName;
  String remark;
  num paySum;

  CustomersHistoryModel({
    required this.payDate,
    required this.bankName,
    required this.remark,
    required this.paySum,
  });

  static CustomersHistoryModel fromJson(json) => CustomersHistoryModel(
      payDate: json['payDate'] ?? 'patDate',
      bankName: json['bankName'] ?? 'bankName',
      remark: json['remark'] ?? 'remark',
      paySum: json['paySum'] ?? 0.00);
}
