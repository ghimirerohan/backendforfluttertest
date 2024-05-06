import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String? error;
  const ErrorPage({super.key, this.error});

  static Route<void> route(String error) {
    return MaterialPageRoute<void>(builder: (_) =>  ErrorPage(error: error,));
  }

  @override
  Widget build(BuildContext context) {
    return  Center(child:
      Text(error ?? "Error , Something went wrong"),);
  }
}
