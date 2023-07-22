import 'package:coffee_optovik/dataBaseTest/dataBaseTest.dart';
import 'package:coffee_optovik/logic/formSubmissionStatus.dart';
import 'package:coffee_optovik/logic/loginBloc/login_bloc_bloc.dart';
import 'package:coffee_optovik/presentation/widgets/usernameField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../../repositories/authRepository.dart';
import '../widgets/passwordTextField.dart';
import 'mainPage.dart';

class LoginPage extends StatelessWidget {
  LoginPage();

  @override
  Widget build(BuildContext context) {
//   void initState() {
//     super.initState();
//  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
//   }
    TextEditingController username = TextEditingController();
    TextEditingController password = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.55,
              child: Placeholder(),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: [
                Text(
                  'Login',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                UsernameField(username: username, ctx: context),
                SizedBox(
                  height: 10,
                ),
                PassField(
                  passwordController: password,
                  ctx: context,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    rememberCheck(),
                    Text('Запомни меня')
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: loginButton(username, password, context)),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget rememberCheck() {
    return BlocBuilder<LoginBlocBloc, LoginBlocState>(
                    builder: (context, state) {
                      return Checkbox(
                          value: state.rememberUser,
                          onChanged: (value) {
                            print(value);
                            context
                                .read<LoginBlocBloc>()
                                .add(LoginRememberUser(rememberUser: value!));
                          });
                    },
                  );
  }

  Widget loginButton(TextEditingController username,
      TextEditingController password, BuildContext context) {
    return BlocBuilder<LoginBlocBloc, LoginBlocState>(
      builder: (context, state) {
        return state.formStatus is FormSubmiting
            ? CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () {
                  // user['username'] = username.text;
                  // user['password'] = password.text;
                  // print('Login button is tapped');
                  // username.text.isEmpty || password.text.isEmpty
                  //     ? print('Dont go')
                  //     : Navigator.of(context).pushReplacementNamed('/mainPage');
                  print("submitted");
                  context.read<LoginBlocBloc>().add(LoginSubmited(
                      username: username.text,
                      password: password.text,
                      context: context,
                      ));
                },
                child: Text('Login'));
      },
    );
  }
}
