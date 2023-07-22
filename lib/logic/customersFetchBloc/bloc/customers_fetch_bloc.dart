import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/customersModel.dart';
import '../../../repositories/customersRepository.dart';

part 'customers_fetch_event.dart';
part 'customers_fetch_state.dart';

class CustomersFetchBloc extends Bloc<CustomersFetchEvent, CustomersFetchState> {
  final CustomersRepository customersRepository;

  CustomersFetchBloc(this.customersRepository) : super(FetchDataLoadingState()) {
    on<LoadCustomersEvent>((event, emit) async {
      emit(FetchDataLoadingState());
      try {
        final customers = await customersRepository.getCustomers();
        emit(FetchDataLoadedState(customers));
      } catch (e) {
        emit(FetchDataErrorState(e.toString()));
      }
    });
  }
}
