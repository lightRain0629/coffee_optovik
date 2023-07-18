import 'package:flutter/material.dart';

import 'clientCard.dart';

class BottomOrderButtonWithTotal extends StatelessWidget {
  const BottomOrderButtonWithTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5
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
          InRowCash(cash: 2145.05),
          TextButton(onPressed: (){}, child: Text('Оформить заказ'))
        ]),
      ),
    );
  }
}