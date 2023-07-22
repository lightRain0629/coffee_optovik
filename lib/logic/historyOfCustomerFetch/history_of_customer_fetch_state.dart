part of 'history_of_customer_fetch_bloc.dart';

abstract class HistoryOfCustomerFetchState extends Equatable {
  const HistoryOfCustomerFetchState();
  
  @override
  List<Object> get props => [];
}

class CustomerHistoryFetchDataLoadingState extends HistoryOfCustomerFetchState {
  @override
  List<Object> get props => [];
}

class CustomerHistoryFetchDataLoadedState extends HistoryOfCustomerFetchState {
  final List<CustomersHistoryModel> customersHistory;

  CustomerHistoryFetchDataLoadedState(this.customersHistory);
  @override
  List<Object> get props => [customersHistory];
}

class CustomerHistoryFetchDataErrorState extends HistoryOfCustomerFetchState {
  final String message;

  CustomerHistoryFetchDataErrorState(this.message);

  @override
  List<Object> get props => [message];
}
