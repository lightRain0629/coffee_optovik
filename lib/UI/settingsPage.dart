import 'package:coffee_optovik/UI/drawerOptovik.dart';
import 'package:flutter/material.dart';

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
          SliverPadding(padding: EdgeInsets.symmetric(horizontal: 20), sliver: SliverList.builder(itemCount: 6,itemBuilder: (context,index)=> Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(10)
            ),
            child: ListTile(
              title: Text( index.isEven ? 'Определенная настройка' : 'Вместо этой странчки можно поставить профиль'),
            ),
          )),)
        ],
      ),
    );
  }
}