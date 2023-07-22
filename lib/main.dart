// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coffee_optovik/logic/loginBloc/login_bloc_bloc.dart';
import 'package:coffee_optovik/repositories/authRepository.dart';
import 'package:coffee_optovik/repositories/customersHistoryRepositories.dart';
import 'package:coffee_optovik/repositories/customersRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'logic/blocNav/navigation_bloc.dart';
import 'presentation/UI/loginPage.dart';
import 'appRoutes/appRoutes.dart';
import 'presentation/colorSchemes/color_schemes.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final preference = await SharedPreferences.getInstance();
  final isLoggedIn = preference.getBool('isLoggedIn') ?? false;
  // final token = preference.getString('token') ?? '';
  runApp(MyApp(
    appRouter: AppRouter(loggedIn: isLoggedIn),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({
    Key? key,
    required this.appRouter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NavigationBloc()),
        RepositoryProvider(
          create: (context) => AuthRepository(),
        ),
        BlocProvider<LoginBlocBloc>(
          create: (context) => LoginBlocBloc(context.read<AuthRepository>()),
        ),
        RepositoryProvider(create: (context) => CustomersRepository()),
        RepositoryProvider(create: (context) => CustomersHistoryRepository()),
      ],
      child: Builder(builder: (context) {
        return BlocProvider(
            create: (context) => LoginBlocBloc(context.read<AuthRepository>()),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme:
                  ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
              darkTheme:
                  ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
              onGenerateRoute: appRouter.onGenerateRoute,
            ));
      }),
    );
  }
}
