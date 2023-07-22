part of 'customers_fetch_bloc.dart';

abstract class CustomersFetchState extends Equatable {
  const CustomersFetchState();
  
  @override
  List<Object> get props => [];
}

class FetchDataLoadingState extends CustomersFetchState {
  @override
  List<Object> get props => [];
}

class FetchDataLoadedState extends CustomersFetchState {
  final List<CustomersModel> customers;

  FetchDataLoadedState(this.customers);
  @override
  List<Object> get props => [customers];
}

class FetchDataErrorState extends CustomersFetchState {
  final String message;

  FetchDataErrorState(this.message);

  @override
  List<Object> get props => [message];
}

