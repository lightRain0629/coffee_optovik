// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'clientDealHistoryModel.dart';

class ClientModelTest {
  final String name;
  final double cash;
  final List<DealHistoryModel> dealHistory;
  final double totalCash;
  ClientModelTest({
    required this.name,
    required this.cash,
    required this.dealHistory,
    required this.totalCash,
  });
  
}
