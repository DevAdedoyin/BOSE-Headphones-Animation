import 'package:bose_ecommerce_animation/constants/colors.dart';
import 'package:bose_ecommerce_animation/constants/font_sizes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _topIconOpacity = 0.1;
  double _leftPosition = -200;
  double _rightPosition = -50;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _topIconOpacity = 1.0;
        _leftPosition = 0;
        _rightPosition = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),

            // TOP ICONS OPACITY ANIMATIONS
            AnimatedOpacity(
              opacity: _topIconOpacity,
              duration: const Duration(milliseconds: 800),
              child: const Row(
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

            // HEADER SLIDE ANIMATIONS
            Container(
              margin: const EdgeInsets.only(top: 30),
              alignment: Alignment.center,
              height: 120,
              child: SizedBox(
                width: size.width,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Stack(
                      children: [
                        AnimatedPositioned(
                          right: _rightPosition,
                          curve: Curves.easeInOut,
                          duration: const Duration(milliseconds: 800),
                          child: Image.asset(
                            "assets/images/blogo.png",
                            height: 100,
                          ),
                        ),
                      ],
                    ),
                    AnimatedPositioned(
                      left: _leftPosition,
                      curve: Curves.easeInOut,
                      duration: const Duration(milliseconds: 800),
                      child: const Text(
                        "Wireless\nHeadphones",
                        style: TextStyle(
                            fontSize: FontSizes.biggestFont,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w700),
                      ),
                    )
                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            // GRIDVIEW ANIMATIONS
            GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: 4,
                itemBuilder: (_, index) {
                  return Container();
                })
          ],
        ),
      ),
    );
  }
}
