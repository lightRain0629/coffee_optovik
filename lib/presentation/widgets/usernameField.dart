import 'package:coffee_optovik/logic/loginBloc/login_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsernameField extends StatelessWidget {
  final BuildContext ctx;
  const UsernameField({
    super.key,
    required this.username,
    required this.ctx,
  });

  final TextEditingController username;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBlocBloc, LoginBlocState>(
      builder: (context, state) {
        return TextFormField(
          onChanged: (value) {
            // print(value);
             context.read<LoginBlocBloc>().add(LoginUsernameChanged(username: value));},
          // onEditingComplete: ()=> context.read<LoginBlocBloc>().add(LoginUsernameChanged(username: username.text)),
          // validator: (value) => state.isValidUsername ? null : 'Username is not valid',
          controller: username,
          scrollPadding:
              EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
          decoration: InputDecoration(
            label: Text('Username'),
          ),
        );
      },
    );
  }
}
