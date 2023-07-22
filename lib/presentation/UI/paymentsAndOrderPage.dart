import 'package:coffee_optovik/presentation/UI/mainPage.dart';
import 'package:coffee_optovik/presentation/widgets/clientCard.dart';
import 'package:flutter/material.dart';

class PaymentsAndOrderPage extends StatelessWidget {
  const PaymentsAndOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MainPage()));
              },
            ),
            title: Text('Оплаты и заказы'),
            actions: [
              IconButton(
                  onPressed: () {
                    print('Payment and Order  search is tapped');
                  },
                  icon: Icon(Icons.search))
            ],
          ),
          SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverList.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) => ClientCard(
                        cash: 51054.02,
                        title: 'Soltan restoran Berkarar SDAM',
                        index: index,
                        subtitle: '21.12.2023',
                        slidable: false,
                      )))
        ],
      ),
    );
  }
}
