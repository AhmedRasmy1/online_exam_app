import 'package:flutter/material.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/bendy-man-developer-writing-programming-code.gif',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
