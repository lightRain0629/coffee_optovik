import 'package:coffee_optovik/dataBaseTest/testClientData.dart';
import 'package:coffee_optovik/widgets/bottomNavBarWithAlign.dart';
import 'package:coffee_optovik/widgets/clientCard.dart';
import 'package:flutter/material.dart';

class HistoryOfClientPage extends StatelessWidget {
  final String name;
  final int indexClient;
  const HistoryOfClientPage({super.key, required this.name, required this.indexClient});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios_new)),
                actions: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.search))
                ],
                floating: true,
                title: Text('История клиента'),
              ),
              SliverToBoxAdapter(
                child: Flexible(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Text(
                      'Движение по ' + name,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
              ),
              SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverList.builder(
                      itemCount: clientsList[indexClient].dealHistory.length,
                      itemBuilder: (context, index) => ClientCard(
                            cash: clientsList[indexClient].dealHistory[index].cash,
                            title: clientsList[indexClient].dealHistory[index].dealCode,
                            index: index,
                            slidable: false,
                            subtitle: clientsList[index].dealHistory[index].dataOfDeal.toString(),
                          ))),
            ],
          ),
          BottomContainerWithAlign(totalCash: clientsList[indexClient].totalCash, dealHistory: clientsList[indexClient].dealHistory,)
        ],
      ),
      // bottomNavigationBar: Container(

      //   margin: EdgeInsets.only(left:20, right:20, bottom: 20),
      //   decoration: BoxDecoration(
      //   color: Colors.green,
      //   borderRadius: BorderRadius.circular(10)
      //   ),
      //   height: 60,
      // ),
    );
  }
}
