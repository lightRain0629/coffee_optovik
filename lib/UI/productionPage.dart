import 'package:coffee_optovik/UI/drawerOptovik.dart';
import 'package:coffee_optovik/widgets/productionCardWithDes.dart';
import 'package:flutter/material.dart';

class ProductionPage extends StatelessWidget {
  const ProductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerOptovik(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            title: Text('Продукция'),
            actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 50,
                child: ListView.builder(
              itemBuilder: (context, index) => Container(
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                padding: EdgeInsets.all(5),
                height: 30,
                decoration: BoxDecoration(
                    color: Theme.of(context).splashColor,
                    borderRadius: BorderRadius.circular(18)),
                child: Center(child: Text( index.isEven? 'Category $index and very big ' : 'small')),
              ),
              itemCount: 5,
              scrollDirection: Axis.horizontal,
            )),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverList.builder(
                itemCount: 10,
                itemBuilder: (context, index) => ProductionCardWithDes(
                    name: 'Movenpick arabica coffee',
                    description:
                        'So i will add about 150 char to test my subtitle also to test flexible space so how are u, honestly i feel better after going to work and after this coffee, as u can see this solved my problem with containers that every moment overflows by text, so im happy to see this, good job',
                    barcode: '252146751348',
                    count: 2015,
                    price: 120)),
          )
        ],
      ),
    );
  }
}
