import 'package:coffee_optovik/UI/paymentsAndOrderPage.dart';
import 'package:coffee_optovik/widgets/drawerButton.dart';
import 'package:flutter/material.dart';

class DrawerOptovik extends StatelessWidget {
  const DrawerOptovik({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
                    SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text('Placeholder', style: Theme.of(context).textTheme.titleLarge,),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        DrawerButtonOptovik(title: 'Оплаты и заказы', icon: Icon(Icons.list), onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> PaymentsAndOrderPage()));}),
        // DrawerButtonOptovik(title: 'Оплаты клиента', icon: Icon(Icons.person_2), onTap: (){Navigator.pop(context);}),
      ]),
    );
  }
}