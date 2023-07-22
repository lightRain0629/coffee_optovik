import 'package:coffee_optovik/dataBaseTest/testClientData.dart';
import 'package:coffee_optovik/presentation/widgets/bottomNavBarWithAlign.dart';
import 'package:coffee_optovik/presentation/widgets/clientCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../logic/historyOfCustomerFetch/history_of_customer_fetch_bloc.dart';
import '../../repositories/customersHistoryRepositories.dart';
import '../widgets/onLoadingContainer.dart';

class HistoryOfClientPage extends StatelessWidget {
  final String name;
  final int indexClient;
  const HistoryOfClientPage(
      {super.key, required this.name, required this.indexClient});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        DateTime now = DateTime.now();
        DateTime initialDate = DateTime(now.year, now.month - 1, now.day);
        return HistoryOfCustomerFetchBloc(
            RepositoryProvider.of<CustomersHistoryRepository>(context))
          ..add(LoadCustomersHistoryEvent(
              customerId: indexClient,
              date: DateFormat('yyyy-MM-dd').format(initialDate)));
      },
      child:
          BlocBuilder<HistoryOfCustomerFetchBloc, HistoryOfCustomerFetchState>(
        builder: (context, state) {
          List customersPay = state is CustomerHistoryFetchDataLoadedState
              ? List.generate(state.customersHistory.length, (index) {
                  final payments = state.customersHistory[index].paySum;
                })
              : [];
          double total() {
            double res = 0.00;
            for (var i = 0; i < customersPay.length; i++) {
              res = res + (customersPay[i] ?? 0);
            }
            return res;
          }

          return Scaffold(
            body: Stack(
              children: [
                CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      leading: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back_ios_new)),
                      actions: [
                        IconButton(
                            onPressed: () {
                              DateTime now = DateTime.now();
                              DateTime initialDate =
                                  DateTime(now.year, now.month - 1, now.day);
                              showDatePicker(
                                      context: context,
                                      initialDate: initialDate,
                                      firstDate: DateTime(2010),
                                      lastDate: DateTime(2099))
                                  .then((DateTime? value) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        duration: Duration(seconds: 1),
                                        content:
                                            Text('Selected datetime: $value')));
                                context
                                    .read<HistoryOfCustomerFetchBloc>()
                                    .add(LoadCustomersHistoryEvent(
                                      customerId: indexClient,
                                      date: DateFormat('yyyy-MM-dd')
                                          .format(value ?? initialDate),
                                    ));
                              });
                            },
                            icon: Icon(Icons.date_range_rounded)),
                        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                      ],
                      floating: true,
                      title: Text('История клиента'),
                    ),
                    SliverToBoxAdapter(
                      child: Flexible(
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          child: Text(
                            'Движение по ' + name,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      ),
                    ),
                    state is CustomerHistoryFetchDataLoadedState
                        ? SliverPadding(
                            padding: EdgeInsets.only(
                                left: 20, right: 20, bottom: 80),
                            sliver: SliverList.builder(
                                itemCount: state.customersHistory.length,
                                itemBuilder: (context, index) {
                                  final customer =
                                      state.customersHistory[index];
                                  return ClientCard(
                                    cash: customer.paySum.toDouble(),
                                    historyCustomerDate: customer.payDate,
                                    index: index,
                                    slidable: false,
                                    historyCustomerBankName: customer.bankName,
                                    historyCustomerRemark: customer.remark,
                                  );
                                }))
                        : SliverPadding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            sliver: SliverList.builder(
                                itemCount: 5,
                                itemBuilder: ((context, index) {
                                  return OnLoadingContainer(
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height *
                                        0.12,
                                    color: Theme.of(context).splashColor,
                                    child: ListTile(
                                      title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          OnLoadingContainer(
                                            width: double.infinity,
                                            height: 10,
                                            child: Container(),
                                            color: Colors.grey,
                                          ),
                                          OnLoadingContainer(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.5,
                                              height: 10,
                                              color: Colors.grey,
                                              child: Container()),
                                          Divider(
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .color,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              OnLoadingContainer(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.3,
                                                  height: 10,
                                                  color: Colors.grey,
                                                  child: Container()),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                })))
                  ],
                ),
                BottomContainerWithAlign(
                    totalCash: state is CustomerHistoryFetchDataLoadedState
                        ? total()
                        : 0.00)
              ],
            ),
            // bottomNavigationBar: Container(  CustomerHistoryFetchDataLoadedState

            //   margin: EdgeInsets.only(left:20, right:20, bottom: 20),
            //   decoration: BoxDecoration(
            //   color: Colors.green,
            //   borderRadius: BorderRadius.circular(10)
            //   ),
            //   height: 60,
            // ),
          );
        },
      ),
    );
  }
}
