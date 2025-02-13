import 'package:bose_ecommerce_animation/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BoseHeadPhones());
}

class BoseHeadPhones extends StatelessWidget {
  const BoseHeadPhones({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BOSE Headphones',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
