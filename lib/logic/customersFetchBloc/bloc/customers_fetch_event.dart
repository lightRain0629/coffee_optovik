part of 'customers_fetch_bloc.dart';

abstract class CustomersFetchEvent extends Equatable {
  const CustomersFetchEvent();

  @override
  List<Object> get props => [];
}

class LoadCustomersEvent extends CustomersFetchEvent{
    @override
  List<Object> get props => [];
}
