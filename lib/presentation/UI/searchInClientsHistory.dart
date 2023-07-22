// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:coffee_optovik/presentation/widgets/clientCard.dart';
import 'package:intl/intl.dart';

import '../../dataBaseTest/testClientData.dart';
import '../../models/customersHistoryModel.dart';

class SearchInClientsHistory extends SearchDelegate {
  final List<CustomersHistoryModel> historyList;
  final currencyName;

  // final List<String> historyListName;

  List<String> results = [];

  SearchInClientsHistory({
    required this.historyList,
     this.currencyName = 'TMT',
  });

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios_new));
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query != null) {


      List<CustomersHistoryModel> results = historyList
          .where(
              (element) => element.bankName.toLowerCase().contains(query.toLowerCase()) || DateFormat('dd.MM.yyyy').format(DateTime.parse(element.payDate)).toLowerCase().contains(query.toLowerCase()) || element.paySum.toString().toLowerCase().contains(query.toLowerCase()))
          .toList();

if (results.isEmpty) {
  return Center(
    child: Text('Не найдено'),
  );
} else {
        return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
            itemCount: results.length,
            itemBuilder: (context, index) {
              return ClientCard(
                slidable: false,
                cash: results[index].paySum.toDouble(),
                historyCustomerDate: results[index].payDate,
                index: index,
                currencyName: currencyName,
                historyCustomerBankName: results[index].bankName,
                historyCustomerRemark: historyList[index].remark,
              );
            }),
      );
}
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            ListTile(title: Text('no found'),)
            ],
        ),
      );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // return Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 20),
    //   child: ListView.builder(
    //       itemCount: 2,
    //       itemBuilder: (context, index) => ClientCard(
    //         index: index,
    //             cash: 4000.08,
    //             title: 'title',
    //           )),
    // );
    return SizedBox();
  }
}
