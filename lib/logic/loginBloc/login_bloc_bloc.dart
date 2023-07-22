import 'package:bloc/bloc.dart';
import 'package:coffee_optovik/repositories/authRepository.dart';
import 'package:equatable/equatable.dart';

import '../formSubmissionStatus.dart';

part 'login_bloc_event.dart';
part 'login_bloc_state.dart';

class LoginBlocBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  final AuthRepository authRepository;
  LoginBlocBloc(this.authRepository) : super(LoginBlocState(rememberUser: false, token: '', formStatus: const InitialFormStatus(), password: '', username: '', )) {
    on<LoginUsernameChanged>((event, emit) => emit(state.copyWith(formStatus: state.formStatus, username: event.username, password: state.password, token: state.token, rememberUser: state.rememberUser)));


    on<LoginPasswordChanged>((event, emit) => emit(state.copyWith(formStatus: state.formStatus, username: state.username, password: event.password, token: state.token, rememberUser: state.rememberUser)));
    


    on<LoginRememberUser>((event, emit){
     emit(state.copyWith(formStatus: state.formStatus, username: state.username, password: state.password, token: state.token, rememberUser: event.rememberUser));
     print(event.rememberUser);
    });
    on<LoginSubmited>((event, emit) async {
      print(event.username);
      print(event.password);
      await authRepository.login(event.username, event.password, event.context, state.rememberUser);
    });
  }

    

  // Stream<LoginBlocState> mapEventToState(LoginBlocState event) async* {
  //   if (state is LoginUsernameChanged ) {
  //     yield state.copyWith(username: event.username, password: state.password);
  //   } else if ( state is LoginPasswordChanged) {
  //     yield state.copyWith(password: event.password, username: state.username);
  //   } else if ( state is LoginSubmited){
  //     yield state.copyWith(formStatus: FormSubmiting(), username: state.username, password: state.password);
  //   }
  //   try {
  //     await authRepository.login(state.username, state.password);
  //     yield state.copyWith(formStatus: SubmittionSuccess(), username: state.username, password: state.password);
  //                     print(state.username + state.password);
  //   } catch (e) {
  //     yield state.copyWith(formStatus: SubmitionFailed(e), username: state.username, password: state.password);
  //   }
  // }
}
