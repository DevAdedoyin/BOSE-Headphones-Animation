import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final double _topIconOpacity = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AnimatedOpacity(
            opacity: _topIconOpacity,
            duration: const Duration(milliseconds: 500),
            child: const Row(
              children: [],
            ),
          )
        ],
      ),
    );
  }
}
