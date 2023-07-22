// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc_bloc.dart';

abstract class LoginBlocEvent extends Equatable {
  const LoginBlocEvent();

  @override
  List<Object> get props => [];
}


class LoginUsernameChanged extends LoginBlocEvent {
  final String username;
  LoginUsernameChanged({ required this.username});
}

class LoginPasswordChanged extends LoginBlocEvent {
  final String password;
  LoginPasswordChanged({ required this.password});
}

class LoginRememberUser extends LoginBlocEvent {
  final bool rememberUser;
  LoginRememberUser({
    required this.rememberUser,
  });
   
}

class LoginSubmited extends LoginBlocEvent {
  final String username;
  final String password;
  final context;
  LoginSubmited({
    required this.username,
    required this.password,
    required this.context,

  });
}
