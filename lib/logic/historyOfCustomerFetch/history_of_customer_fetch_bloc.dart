import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

import '../../models/customersHistoryModel.dart';
import '../../repositories/customersHistoryRepositories.dart';

part 'history_of_customer_fetch_event.dart';
part 'history_of_customer_fetch_state.dart';

class HistoryOfCustomerFetchBloc extends Bloc<HistoryOfCustomerFetchEvent, HistoryOfCustomerFetchState> {
 final CustomersHistoryRepository customersHistoryRepository;
  HistoryOfCustomerFetchBloc(this.customersHistoryRepository) : super(CustomerHistoryFetchDataLoadingState()) {
    on<LoadCustomersHistoryEvent>((event, emit) async {
      try {
        final customersHistory = await customersHistoryRepository.getCustomers(event.customerId, event.date);
        emit(CustomerHistoryFetchDataLoadedState(customersHistory));
      } catch (e) {
        emit(CustomerHistoryFetchDataErrorState(e.toString()));
      }
    });
  }
}
