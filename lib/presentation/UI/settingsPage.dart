import 'package:coffee_optovik/presentation/UI/drawerOptovik.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'loginPage.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerOptovik(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Настройки'),
          ),
          SliverPadding(padding: EdgeInsets.symmetric(horizontal: 20), sliver: SliverList.builder(itemCount: 1,itemBuilder: (context,index)=> Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(10)
            ),
            child: InkWell(
              onTap: () async {
              final preferences = await SharedPreferences.getInstance();
              preferences.setBool('isLoggedIn', false);
              Navigator.of(context).pushReplacementNamed('/login');
            },
              child: ListTile(
                leading: Icon(Icons.logout),
                title: Text('Выйти'),
              ),
            ),
          )),)
        ],
      ),
    );
  }
}