import 'package:coffee_optovik/logic/customersFetchBloc/bloc/customers_fetch_bloc.dart';
import 'package:coffee_optovik/models/customersModel.dart';
import 'package:coffee_optovik/presentation/UI/searchClientUI.dart';
import 'package:coffee_optovik/dataBaseTest/testClientData.dart';
import 'package:coffee_optovik/presentation/widgets/onLoadingContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/customersRepository.dart';
import '../widgets/clientCard.dart';

class ClientPage extends StatelessWidget {

  const ClientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomersFetchBloc(
          RepositoryProvider.of<CustomersRepository>(context))
        ..add(LoadCustomersEvent()),
      child: BlocBuilder<CustomersFetchBloc, CustomersFetchState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                actions: [
                  IconButton(
                      onPressed: () => showSearch(
                          context: context, delegate: SearchClient()),
                      icon: Icon(Icons.search))
                ],
                title: Text('Клиенты'),
              ),
              state is FetchDataLoadedState
                  ? SliverPadding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      sliver: SliverList.builder(
                          itemCount: state.customers.length,
                          itemBuilder: ((context, index) {
                            List<CustomersModel> customersList =
                                state.customers;
                            final customer = customersList[index];
                            return ClientCard(
                              cash: customer.balance.toDouble(),
                              index: customer.id,
                              title: customer.name,
                              currencyName: customer.currencyName,
                            );
                          })))
                  : OnLoadingClientCard()
            ],
          );
        },
      ),
    );
  }
}

class OnLoadingClientCard extends StatelessWidget {
  const OnLoadingClientCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        sliver: SliverList.builder(
            itemCount: 5,
            itemBuilder: ((context, index) {
              return OnLoadingContainer(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.11,
                color: Theme.of(context).splashColor,
                child: ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OnLoadingContainer(
                        width: double.infinity,
                        height: 10,
                        child: Container(),
                        color: Colors.grey,
                      ),
                      OnLoadingContainer(
                          width:
                              MediaQuery.of(context).size.width *
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
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                         OnLoadingContainer(
                          width:
                              MediaQuery.of(context).size.width *
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
            })));
  }
}
