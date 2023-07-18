import 'package:coffee_optovik/UI/historyOfClientPage.dart';
import 'package:coffee_optovik/UI/newOrderPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

justSortPrice(double price) {
  List priceString = price.toString().split('');
  List priceStringReversed = priceString.reversed.toList();
  print(priceString);
  for (var i = 0; i < priceStringReversed.length; i++) {
    if (priceStringReversed[1] == '.') {
      priceStringReversed.insert(i, '0');
    } else {
      if (priceStringReversed[2] == '.') {
        if (i == 6) {
          priceStringReversed.insert(i, ' ');
        } else if (i == 10) {
          priceStringReversed.insert(i, ' ');
        } else if (i == 14) {
          priceStringReversed.insert(i, ' ');
        } else if (i == 19) {
          priceStringReversed.insert(i, ' ');
        }
        ;
      } else if (priceStringReversed[i] != '.') {
        priceStringReversed.removeAt(i);
        print(priceStringReversed[i]);
      }
    }
  }
  return (priceStringReversed.reversed.toList().join(''));
}

class ClientCard extends StatelessWidget {
  final int index;
  final double cash;
  final String title;
  final String subtitle;
  final bool slidable;
  const ClientCard({
    super.key,
    required this.cash,
    required this.title,
    required this.index,
    this.subtitle = '',
    this.slidable = true,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.only(left: 6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.primaryContainer),
        child: Slidable(
          enabled: slidable,
          endActionPane: ActionPane(motion: DrawerMotion(), children: [
            SlidableAction(
              onPressed: (context) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NewOrderPage(name: title,)));
              },
              backgroundColor: Theme.of(context).colorScheme.tertiary,
              icon: Icons.add,
            ),
            SlidableAction(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(10)),
              onPressed: (context) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HistoryOfClientPage(
                              name: title,
                              indexClient: index,
                            )));
              },
              backgroundColor: Theme.of(context).colorScheme.secondary,
              icon: Icons.document_scanner,
            ),
          ]),
          key: ValueKey(index),
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              subtitle: subtitle == '' ? null : Text(subtitle),
              title: Flexible(
                  child: Container(
                      child: Text(
                title,
              ))),
              trailing: InRowCash(
                cash: cash,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class InRowCash extends StatelessWidget {
  final double cash;

  final bool smallPrice;
  const InRowCash({super.key, required this.cash,   this.smallPrice = true });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      textBaseline: TextBaseline.alphabetic,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(justSortPrice(cash),
            style: TextStyle(
                color: cash.isNegative
                    ? Colors.red
                    : Theme.of(context).colorScheme.tertiary,
                fontSize: smallPrice ? Theme.of(context).textTheme.bodyLarge!.fontSize : Theme.of(context).textTheme.titleLarge!.fontSize)),
        Text(
          ' TMT',
          style: TextStyle(
              fontSize: smallPrice ? Theme.of(context).textTheme.bodySmall!.fontSize : Theme.of(context).textTheme.titleSmall!.fontSize,
              color: cash.isNegative
                  ? Colors.red
                  : Theme.of(context).colorScheme.tertiary),
        )
      ],
    );
  }
}
