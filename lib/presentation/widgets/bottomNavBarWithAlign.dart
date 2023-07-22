
import 'package:flutter/material.dart';

import 'clientCard.dart';

class BottomContainerWithAlign extends StatelessWidget {
  // TEST
  final double totalCash;

  // TEST
  const BottomContainerWithAlign({super.key, required this.totalCash,});

  // TEST

  // totalCashCalc(){
  //   double res = 0.00;
  //   for (var i = 0; i < dealHistory.length; i++) {
  //     res += dealHistory[i].cash;
  //   }
  //   return res;
  // }
  // TEST

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        // margin: EdgeInsets.symmetric(
        //   horizontal: 10,
        //   vertical: 20,
        // ),
        height: MediaQuery.of(context).size.height * 0.08,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiaryContainer,
            borderRadius: BorderRadius.circular(10)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            'Итого:',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          InRowCash(cash: totalCash)
        ]),
      ),
    );
  }
}
