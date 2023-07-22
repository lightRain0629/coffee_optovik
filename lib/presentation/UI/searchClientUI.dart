import 'package:coffee_optovik/presentation/widgets/clientCard.dart';
import 'package:flutter/material.dart';

import '../../dataBaseTest/testClientData.dart';

class SearchClient extends SearchDelegate {

  List <String> results = [];

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
    if ( query != null) {
      results = ['name', 'second name'].where((element) => element.toLowerCase().contains(query.toLowerCase())).toList();
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          itemCount: results.length,
          itemBuilder: (context,index) {
            return ClientCard(cash: 4000.08, title: results[index], index: index,);
          }
        ),
      );
    } else {
      return Center(
        child: Text('No result found'),
      );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) => ClientCard(
            index: index,
                cash: 4000.08,
                title: 'title',
              )),
    );
  }
}
