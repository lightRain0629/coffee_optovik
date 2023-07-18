
import 'package:coffee_optovik/UI/searchClientUI.dart';
import 'package:coffee_optovik/dataBaseTest/testClientData.dart';
import 'package:flutter/material.dart';

import '../widgets/clientCard.dart';

class ClientPage extends StatelessWidget {
  final double cash;
  const ClientPage({super.key, required this.cash});



  @override
  Widget build(BuildContext context) {
    
    return CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                actions: [
                  IconButton(onPressed: () => showSearch(context: context, delegate: SearchClient()), icon: Icon(Icons.search))
                ],
                title: Text('Клиенты'),
              ),
              SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverList.builder(
                      itemCount: clientsList.length,
                      itemBuilder: ((context, index) => ClientCard(
                            cash: clientsList[index].cash,
                            index: index,
                            title: clientsList[index].name,
                          )))),
            ],
          );
  }
}