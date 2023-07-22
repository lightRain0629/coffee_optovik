import 'package:coffee_optovik/presentation/UI/loginPage.dart';
import 'package:coffee_optovik/presentation/UI/paymentsAndOrderPage.dart';
import 'package:coffee_optovik/presentation/widgets/drawerButton.dart';
import 'package:coffee_optovik/storage/storage.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerOptovik extends StatefulWidget {
  const DrawerOptovik({super.key});

  @override
  State<DrawerOptovik> createState() => _DrawerOptovikState();
}




class _DrawerOptovikState extends State<DrawerOptovik> {
  // @override
  // void initState() async {
  //   // TODO: implement initState
  //   super.initState();
  //         final preference = await SharedPreferences.getInstance();
  //     final shortName =  preference.getString('shortName');
  // }
  @override
  Widget build(BuildContext context)  {
    return Drawer(
      child: Column(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
               "shortName",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        DrawerButtonOptovik(
            title: 'Оплаты и заказы',
            icon: Icon(Icons.list),
            onTap: () {
              Navigator.of(context).pushNamed('/paymentsAndOrderPage');
            }),
      ]),
    );
  }
}
