part of 'history_of_customer_fetch_bloc.dart';

abstract class HistoryOfCustomerFetchEvent extends Equatable {
  const HistoryOfCustomerFetchEvent();

  @override
  List<Object> get props => [];
}

class LoadCustomersHistoryEvent extends HistoryOfCustomerFetchEvent{
  final int customerId;
  final String date;

  LoadCustomersHistoryEvent({ required this.customerId, required this.date});

    @override
  List<Object> get props => [customerId, date];
}