import 'package:coffee_optovik/appRoutes/appRoutes.dart';
import 'package:coffee_optovik/presentation/UI/historyOfClientPage.dart';
import 'package:coffee_optovik/presentation/UI/newOrderPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';

// justSortPrice(double price) {
//   List priceString = price.toString().split('');
//   List priceStringReversed = priceString.reversed.toList();
//   print(priceString);
//   for (var i = 0; i < priceStringReversed.length; i++) {
//     if (priceStringReversed[1] == '.') {
//       priceStringReversed.insert(i, '0');
//     } else {
//       if (priceStringReversed[2] == '.') {
//         if (i == 6) {
//           priceStringReversed.insert(i, ' ');
//         } else if (i == 10) {
//           priceStringReversed.insert(i, ' ');
//         } else if (i == 14) {
//           priceStringReversed.insert(i, ' ');
//         } else if (i == 19) {
//           priceStringReversed.insert(i, ' ');
//         }
//         ;
//       } else if (priceStringReversed[i] != '.') {
//         priceStringReversed.removeAt(i);
//         print(priceStringReversed[i]);
//       }
//     }
//   }
//   return (priceStringReversed.reversed.toList().join(''));
// }

class ClientCard extends StatelessWidget {
  final int index;
  final double cash;
  final String title;
  final String subtitle;
  final bool slidable;
  final String currencyName;

  final String historyCustomerBankName;
  final String historyCustomerRemark;
  final String historyCustomerDate;
  const ClientCard(
      {
        this.historyCustomerDate = '',

      this.historyCustomerBankName = '',
      this.historyCustomerRemark = '',
      super.key,
      required this.cash,
       this.title = '',
      required this.index,
      this.subtitle = '',
      this.slidable = true,
      this.currencyName = 'TMT'});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.only(left: 6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.secondaryContainer),
        child: Slidable(
          enabled: slidable,
          endActionPane: ActionPane(motion: DrawerMotion(), children: [
            SlidableAction(
              onPressed: (context) {
                // Navigator.of(context).pushNamed('/newOrderPage');
                Navigator.push(
                    context,
                    PageTransition(
                        isIos: true,
                        child: NewOrderPage(
                          id: index,
                        ),
                        type: PageTransitionType.rightToLeft,
                        duration: Duration(milliseconds: 400),
                        reverseDuration: Duration(milliseconds: 400)));
              },
              backgroundColor: Theme.of(context).colorScheme.tertiary,
              icon: Icons.add,
            ),
            SlidableAction(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(10)),
              onPressed: (context) {
                // Navigator.of(context).pushNamed('/historyOfClient');
                Navigator.push(
                    context,
                    PageTransition(
                        isIos: true,
                        child: HistoryOfClientPage(
                          indexClient: index,
                          name: title,
                        ),
                        type: PageTransitionType.rightToLeft,
                        duration: Duration(milliseconds: 400),
                        reverseDuration: Duration(milliseconds: 400)));
              },
              backgroundColor: Theme.of(context).colorScheme.primary,
              icon: Icons.document_scanner,
            ),
          ]),
          key: ValueKey(index),
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              // subtitle: subtitle == '' ? null : Text(subtitle),
              title: Flexible(
                  child: Column(
                children: [
                                    historyCustomerBankName != ''
                      ? Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              child: Text(
                              historyCustomerBankName,
                            )),
                        ],
                      )
                      : SizedBox(),
                                    historyCustomerDate != ''
                      ? Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              child: Text(
                              DateFormat('dd.MM.yy').format(DateTime.parse(historyCustomerDate)),
                            )),
                        ],
                      )
                      : SizedBox(),
                  title != '' ? Container(
                      child: Text(
                    title,
                  )) : SizedBox(),

                  historyCustomerRemark != ''
                      ? Container(
                          child: Text(
                          historyCustomerRemark,
                        ))
                      : SizedBox(),
                  Divider(
                    color: Theme.of(context).textTheme.bodyMedium!.color,
                  )
                ],
              )),
              // trailing: InRowCash(
              //   cash: cash,
              // ),
              subtitle: InRowCash(
                cash: cash,
                currencyName: currencyName,
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
  final String currencyName;
  final bool smallPrice;
  const InRowCash(
      {super.key,
      required this.cash,
      this.smallPrice = true,
      this.currencyName = 'TMT'});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      textBaseline: TextBaseline.alphabetic,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(cash.toDouble().toString(),
            style: TextStyle(
                color: cash.isNegative
                    ? Colors.red
                    : Theme.of(context).colorScheme.tertiary,
                fontSize: smallPrice
                    ? Theme.of(context).textTheme.bodyLarge!.fontSize
                    : Theme.of(context).textTheme.titleLarge!.fontSize)),
        Text(
          " $currencyName",
          style: TextStyle(
              fontSize: smallPrice
                  ? Theme.of(context).textTheme.bodySmall!.fontSize
                  : Theme.of(context).textTheme.titleSmall!.fontSize,
              color: cash.isNegative
                  ? Colors.red
                  : Theme.of(context).colorScheme.tertiary),
        )
      ],
    );
  }
}
