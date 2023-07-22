// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc_bloc.dart';

class LoginBlocState extends Equatable {

  final bool rememberUser;
  final String token;
  final String username;
  bool get isValidUsername => username.length > 1;
  final String password;
  bool get isValidPassword => password.length > 1;
  final FormSubmitionStatus formStatus;

  const LoginBlocState({ required this.username, required this.password, required this.formStatus, required this.rememberUser, required this.token,  });
  
  @override
  List<Object> get props => [username, password, formStatus, token, rememberUser];

  LoginBlocState copyWith({
    required String token,
     required String username,
     required String password,
    FormSubmitionStatus? formStatus,
     required bool rememberUser
  }) {
    return LoginBlocState(
      token: token,
      rememberUser: rememberUser,
      username: username ,
      password: password,
      formStatus: formStatus ?? this.formStatus
    );
  }
}

