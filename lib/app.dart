

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextera_customer_info/custdetail/bloc/custdetail_state.dart';
import 'package:nextera_customer_info/custdetail/repo/custdetailRepo.dart';
import 'package:nextera_customer_info/error_page/errorPage.dart';
import 'package:nextera_customer_info/splash/view/splash_page.dart';

import '404_notfound_page/404page.dart';
import 'custdetail/bloc/custdetail_bloc.dart';
import 'custdetail/view/custDetailPage.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final CustDetailRepo _repo;

  @override
  void initState() {
    super.initState();
    _repo = CustDetailRepo();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CustDetailBloc(
       repo: _repo
      ),
      child: const AppView(),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener<CustDetailBloc, CustDetailState>(
          listener: (context, state) {
            switch (state.status) {
              case CustDetailAppStatus.error:
                _navigator.pushAndRemoveUntil<void>(
                  ErrorPage.route("Some Thing Went Wrong"),
                      (route) => false,
                );
              case CustDetailAppStatus.invalid:
                _navigator.pushAndRemoveUntil<void>(
                  NotFound404.route(),
                      (route) => false,
                );

              case CustDetailAppStatus.valid:
                _navigator.pushAndRemoveUntil<void>(
                  CustDetailPage.route(context.read<CustDetailBloc>().state.customer!),
                      (route) => false,
                );
              case CustDetailAppStatus.unknown:
                break;
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}