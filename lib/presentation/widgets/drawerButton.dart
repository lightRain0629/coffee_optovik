import 'package:flutter/material.dart';

class DrawerButtonOptovik extends StatelessWidget {
  final String title;
  final Icon icon;
  final Function() onTap;
  const DrawerButtonOptovik({super.key, required this.title, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return         InkWell(
                onTap: onTap,
                child: ListTile(
                  leading: icon,
                  title: Text(title, style: Theme.of(context).textTheme.titleMedium,),
                  // trailing: Text(state.allTasks.length.toString()),
                ),
              );
  }
}