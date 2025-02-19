import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final int index;

  const DetailScreen({required this.index, super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            child: Stack(
              children: [
                Positioned(
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back_ios_new),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
