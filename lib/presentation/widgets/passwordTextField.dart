import 'package:coffee_optovik/logic/loginBloc/login_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PassField extends StatefulWidget {
  final passwordController;
  final BuildContext ctx;

  const PassField(
      {super.key, required this.passwordController, required this.ctx});

      

  @override
  State<PassField> createState() => _PassFieldState();
}



bool _obscureText = true;

// String? _password;

class _PassFieldState extends State<PassField> {
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBlocBloc, LoginBlocState>(
      builder: (context, state) {
        return TextFormField(
          onChanged: (value) => context.read<LoginBlocBloc>().add(LoginPasswordChanged(password: value)),
          // validator: (value) => state.isValidPassword ? null : 'Password not valid',
          scrollPadding: EdgeInsets.only(
              bottom: MediaQuery.of(widget.ctx).viewInsets.bottom),
          controller: widget.passwordController,
          obscureText: _obscureText,
          decoration: InputDecoration(
              labelText: 'Пароль',
              suffix: IconButton(
                  onPressed: _toggle,
                  icon: _obscureText
                      ? Icon(Icons.lock_open)
                      : Icon(Icons.lock_outlined))),
        );
      },
    );
  }
}
