import 'package:coffee_optovik/presentation/UI/loginPage.dart';
import 'package:coffee_optovik/presentation/UI/mainPage.dart';
import 'package:coffee_optovik/presentation/UI/newOrderPage.dart';
import 'package:coffee_optovik/presentation/UI/productPage.dart';
import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';

import '../presentation/UI/historyOfClientPage.dart';
import '../presentation/UI/paymentsAndOrderPage.dart';


class AppRouter {
  final loggedIn;

  AppRouter({ required this.loggedIn});
  Route onGenerateRoute(RouteSettings routeSettings)  {
    switch (routeSettings.name)  {
      case '/':
        return PageTransition(
              isIos: true,
              child: loggedIn ? MainPage() : LoginPage(),
              type: PageTransitionType.rightToLeft,
              settings: routeSettings,
              duration: Duration(milliseconds: 400),
              reverseDuration: Duration(milliseconds: 400)
            );
      case '/login':
        return PageTransition(
              isIos: true,
              child: LoginPage(),
              type: PageTransitionType.rightToLeft,
              settings: routeSettings,
              duration: Duration(milliseconds: 400),
              reverseDuration: Duration(milliseconds: 400)
            );

      case '/mainPage':
        return PageTransition(
              isIos: true,
              child: MainPage(),
              type: PageTransitionType.rightToLeft,
              settings: routeSettings,
              duration: Duration(milliseconds: 400),
              reverseDuration: Duration(milliseconds: 400)
            );

      case '/newOrderPage':
        return PageTransition(
              isIos: true,
              child: NewOrderPage(id: 1,),
              type: PageTransitionType.rightToLeft,
              settings: routeSettings,
              duration: Duration(milliseconds: 400),
              reverseDuration: Duration(milliseconds: 400)
            );

      case '/historyOfClient':
        return PageTransition(
              isIos: true,
              child: HistoryOfClientPage(indexClient: 1, name: 'name', ),
              type: PageTransitionType.rightToLeft,
              settings: routeSettings,
              duration: Duration(milliseconds: 400),
              reverseDuration: Duration(milliseconds: 400)
            );
      case '/productPage':
        return PageTransition(
              isIos: true,
              child: ProductPage(),
              type: PageTransitionType.rightToLeft,
              settings: routeSettings,
              duration: Duration(milliseconds: 400),
              reverseDuration: Duration(milliseconds: 400)
            );
      case '/paymentsAndOrderPage':
        return PageTransition(
              isIos: true,
              child: PaymentsAndOrderPage(),
              type: PageTransitionType.rightToLeft,
              settings: routeSettings,
              duration: Duration(milliseconds: 400),
              reverseDuration: Duration(milliseconds: 400)
            );
      default:
        return PageTransition(
              isIos: true,
              child: LoginPage(),
              type: PageTransitionType.rightToLeft,
              settings: routeSettings,
              duration: Duration(milliseconds: 400),
              reverseDuration: Duration(milliseconds: 400)
            );
  }
}
}