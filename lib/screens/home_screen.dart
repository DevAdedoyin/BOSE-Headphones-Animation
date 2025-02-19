import 'package:bose_ecommerce_animation/constants/colors.dart';
import 'package:bose_ecommerce_animation/constants/font_sizes.dart';
import 'package:bose_ecommerce_animation/model/bose_mode.dart';
import 'package:bose_ecommerce_animation/widget/home_grid_item_widget.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin {
  double _topIconOpacity = 0.1;
  double _leftPosition = -200;
  double _rightPosition = -50;
  double _leftGridPosition = -200;
  double _rightGridPosition = 200;
  late AnimationController _controller;
  late AnimationController _spaceController;
  late Animation<double> _curvedAnimation;
  late Animation<double> _spacingAnimation;

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

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );

    _spaceController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceOut, // Smooth easing
    );

    Future.delayed(const Duration(milliseconds: 1200), () {
      setState(() {
        _leftGridPosition = 0;
        _rightGridPosition = 0;
      });
      if (mounted) {
        _controller.forward();
      }
    });

    _spacingAnimation = Tween<double>(begin: 0.0, end: 15.0).animate(
      CurvedAnimation(parent: _spaceController, curve: Curves.easeInOut),
    );

    Future.delayed(const Duration(milliseconds: 600), () {
      if (mounted) _spaceController.forward();
    });


  }

  @override
  void dispose() {
    _controller.dispose();
    _spaceController.dispose();
    super.dispose();
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
            SizedBox(
              height: size.height * 0.05,
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

            // GRIDVIEW ANIMATIONS
            Flexible(
              // fit: FlexFit.tight,
              child: AnimatedBuilder(
                  animation: _spacingAnimation,
                builder: (context, child) {
                  return GridView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 3/4.35,
                          crossAxisCount: 2,
                          mainAxisSpacing: _spacingAnimation.value,
                          crossAxisSpacing: _spacingAnimation.value),
                      itemCount: BoseModelListClass.boseModelList.length,
                      itemBuilder: (_, index) {
                        return AnimatedBuilder(
                          animation: _controller,
                          builder: (context, child) {
                            return Transform.rotate(
                              angle: (index + 1) % 2 != 0
                                  ? ((-pi / 4) * (1 - _curvedAnimation.value))
                                  : ((pi / 4) * (1 - _curvedAnimation.value)),
                              child: child,
                            );
                          },
                          child: Stack(
                            children: [
                              (index + 1) % 2 != 0
                                  ? AnimatedPositioned(
                                      left: _leftGridPosition,
                                      curve: Curves.easeInOut,
                                      duration: const Duration(milliseconds: 350),
                                      child: HomeGridItemWidget(index: index))
                                  : AnimatedPositioned(
                                      left: _rightGridPosition,
                                      curve: Curves.easeInOut,
                                      duration: const Duration(milliseconds: 350),
                                      child: HomeGridItemWidget(index: index)),
                            ],
                          ),
                        );
                      });
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}
