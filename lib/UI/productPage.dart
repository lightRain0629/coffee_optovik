import 'package:coffee_optovik/widgets/bottomOrderButtonWithTotal.dart';
import 'package:coffee_optovik/widgets/clientCard.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios_new),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                expandedHeight: MediaQuery.of(context).size.height * 0.4,
                // flexibleSpace: Flexible(
                //   child: Column(
                //     children: [
                //       SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
                //       Container(
                //         width: double.infinity,
                //         height: MediaQuery.of(context).size.height * 0.4,
                //         child: Image.asset('assets/movenPickHighRes.jpg')),
                //     ],
                //   ),
                // ),
                flexibleSpace: Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  margin: EdgeInsets.only(top: 50),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/movenPickHighRes.jpg'))),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                              child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: Text(
                                    'Movenpick coffee arabica',
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ))),
                          Flexible(
                              child: Container(
                            child: InRowCash(
                              cash: 234.11,
                              smallPrice: false,
                            ),
                          ))
                        ],
                      ),
                      Row(
                        children: [
                          Flexible(
                              child: Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ))
                        ],
                      ),

                    ],
                  ),
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {}, icon: Icon(Icons.add)),
                              Text(
                                '1',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              IconButton(
                                  onPressed: () {}, icon: Icon(Icons.remove)),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Итого:  ',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              InRowCash(
                                cash: 234.11,
                                smallPrice: false,
                              )
                            ],
                          ),
                        ],
                      ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: ElevatedButton(
                        onPressed: () {}, child: Text('Добавить в заказ'))),
              ],
            ),
          )
        ],
      ),
    );
  }
}
