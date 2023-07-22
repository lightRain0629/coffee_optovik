import 'package:coffee_optovik/presentation/widgets/bottomNavBarWithAlign.dart';
import 'package:coffee_optovik/presentation/widgets/bottomOrderButtonWithTotal.dart';
import 'package:coffee_optovik/presentation/widgets/productionCardWithDes.dart';
import 'package:flutter/material.dart';

class NewOrderPage extends StatelessWidget {
  final int id;
  const NewOrderPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text('Новый заказ'),
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios_new)),
              ),
              SliverToBoxAdapter(
                child: Flexible(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Text(
                      id.toString(),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
              ),
              SliverPadding(padding: EdgeInsets.symmetric(horizontal: 20), sliver: SliverList.builder(itemCount: 6,itemBuilder: (context,index)=> ProductionCardWithDes(name: "Movenpick coffee arabica", description: 'Description of this product will be about 20 char... so its placeholder text', barcode: '12524825445', count: 999, price: 2145.00)),),
      
            ],
          ),
          BottomOrderButtonWithTotal()
        ],
      ),
    );
  }
}
