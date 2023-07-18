import 'package:coffee_optovik/UI/clientPage.dart';
import 'package:coffee_optovik/UI/drawerOptovik.dart';
import 'package:coffee_optovik/UI/productionPage.dart';
import 'package:coffee_optovik/UI/settingsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocNav/navigation_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    double cash = 4000.08;




    List pages = [
      ClientPage(cash: cash),
      ProductionPage(),
      SettingsPage(),
    ];

    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, stateNav) {
        return Scaffold(
          drawer: DrawerOptovik(),
          body: pages[stateNav.count],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: stateNav.count,
            onTap: (value){
              context.read<NavigationBloc>().add(OnTapEvent(index: value));
            },
            items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Клиенты',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.production_quantity_limits),
              label: 'Продукция',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Настройки',
            )
          ]),
        );
      },
    );
  }
}
