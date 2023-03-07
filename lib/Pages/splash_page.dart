import 'package:flutter/material.dart';
import 'package:quotes/Pages/home_page.dart';
import 'package:quotes/api/init.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    init().then(
        (value) => Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const HomePage(),
            )));
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
