import 'package:coffee_optovik/widgets/clientCard.dart';
import 'package:flutter/material.dart';

import '../UI/productPage.dart';

class ProductionCardWithDes extends StatelessWidget {
  final String name;
  final String description;
  final String barcode;
  final num count;
  final double price;

  const ProductionCardWithDes(
      {super.key,
      required this.name,
      required this.description,
      required this.barcode,
      required this.count,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductPage()));
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.symmetric(vertical: 5),
          child: ListTile(
            title: Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    'assets/movenPickHighRes.jpg',
                    width: 100,
                    height: 100,
                  ),
                  Flexible(
                      child: Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.w800),
                  )),
                ],
              ),
            ),
            subtitle: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(description),
                    )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      barcode,
                      style: TextStyle(
                            fontSize:
                                Theme.of(context).textTheme.bodyLarge!.fontSize,
                          )
                    ),
                    Row(
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        Text(
                          count.toString(),
                          style: TextStyle(
                            fontSize:
                                Theme.of(context).textTheme.bodyLarge!.fontSize,
                          ),
                        ),
                        Text(
                          ' ШТ',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .fontSize),
                        )
                      ],
                    ),
                    // Row(
                    //   textBaseline: TextBaseline.alphabetic,
                    //   crossAxisAlignment: CrossAxisAlignment.baseline,
                    //   children: [
                    //     Text(
                    //       price.toString(),
                    //       style: TextStyle(
                    //         fontSize:
                    //             Theme.of(context).textTheme.bodyLarge!.fontSize,
                    //         color: Theme.of(context).colorScheme.tertiary,
                    //       ),
                    //     ),
                    //     Text(
                    //       ' TMT',
                    //       style: TextStyle(
                    //           fontSize:
                    //               Theme.of(context).textTheme.bodySmall!.fontSize,
                    //           color: Theme.of(context).colorScheme.tertiary),
                    //     )
                    //   ],
                    // )
                    InRowCash(cash: price)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
