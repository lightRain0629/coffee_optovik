// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'internet_cubit.dart';

abstract class InternetState extends Equatable {
  const InternetState();

  @override
  List<Object> get props => [];
}

class InternetLoading extends InternetState {}

class InternetConnected extends InternetState {
  final ConnectionType connectionType;
  InternetConnected({
    required this.connectionType,
  });
}

class InternetDisconnected extends InternetState {
  final ConnectionType connectionType;

  InternetDisconnected({ required this.connectionType});

}
