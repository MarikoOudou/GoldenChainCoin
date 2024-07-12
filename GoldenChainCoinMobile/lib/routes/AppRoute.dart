import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldenchaincoin/pages/auth/auth_page.dart';
import 'package:goldenchaincoin/pages/buy/buy_page.dart';
import 'package:goldenchaincoin/pages/buy/logic/cubit/buy_cubit.dart';
import 'package:goldenchaincoin/pages/error/Error_page.dart';
import 'package:goldenchaincoin/pages/home/data/repository.dart';
import 'package:goldenchaincoin/pages/home/home_page.dart';
import 'package:goldenchaincoin/pages/home/logic/cubit/home_cubit.dart';

import '../pages/auth/logic/cubit/auth_cubit.dart';

class AppRouter {
  final repository = Repository();
  
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomePage.routeName:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (__) => HomeCubit(repository: repository),
                  child: HomePage(),
                )
              );

      case BuyPage.routeName:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (__) => BuyCubit(),
                  child: BuyPage(),
                )
              );

      case AuthPage.routeName || '/':
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (__) => AuthCubit(),
                  child: AuthPage(),
                ));

      default:
        return MaterialPageRoute(builder: (BuildContext context) {
          return ErrorPage();
        });
    }
  }
}
