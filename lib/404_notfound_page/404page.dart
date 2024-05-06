import 'package:flutter/material.dart';

class NotFound404 extends StatelessWidget {
  const NotFound404({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) =>  const NotFound404());
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("404 Not Found" , style: TextStyle(
        color: Colors.black,
          fontWeight: FontWeight.bold , fontSize: 27),),
    );
  }
}
