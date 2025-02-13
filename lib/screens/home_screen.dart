import 'package:bose_ecommerce_animation/constants/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _topIconOpacity = 0.1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), (){
      setState(() {
        _topIconOpacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            AnimatedOpacity(
              opacity: _topIconOpacity,
              duration: const Duration(milliseconds: 800),
              child: const SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.arrow_back_ios_new,
                      color: AppColors.primaryColor,
                    ),
                    Icon(
                      Icons.search_rounded,
                      color: AppColors.primaryColor,
                    )
                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
