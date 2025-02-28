import 'dart:math';

import 'package:bose_ecommerce_animation/constants/colors.dart';
import 'package:bose_ecommerce_animation/constants/font_sizes.dart';
import 'package:flutter/material.dart';

import '../model/bose_mode.dart';

class DetailScreen extends StatefulWidget {
  final int index;

  const DetailScreen({required this.index, super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with SingleTickerProviderStateMixin {
  double _bottomPosition = -500;
  double _rightPosition = 10;
  double _topPosition = 50;
  Color _color = Colors.white;
   double _bottomBoxHeight = 0;
  double _height = 300;
  double _width = 300;
  double _imageHeight = 50;
  double _opacity = 0;
  double _stackHeight = 150;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(1000);

  late AnimationController _controller;
  late Animation<double> _heightAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _color = _color == Colors.white ? Colors.black : Colors.white;

    _controller = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    );

    _heightAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 395, end: 365), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 365, end: 395), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 395, end: 375), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 375, end: 395), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 395, end: 385), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 385, end: 395), weight: 1),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();
    // _controller.repeat(reverse: false);

    Future.delayed(const Duration(milliseconds: 5), () {
      setState(() {
        _height = 1000;
        _width = 800;
        _imageHeight = 380;
        _stackHeight = 450;
        // _imageWidth = double.maxFinite;
        _topPosition = 0;
        _bottomPosition = 0;
        _opacity = 1;
        _bottomBoxHeight = 250;
        _borderRadius = BorderRadius.circular(1);
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      // backgroundColor: Colors.black,
      body: Center(
        child: AnimatedContainer(
          decoration: BoxDecoration(color: _color, borderRadius: _borderRadius),
          duration: const Duration(milliseconds: 500),
          height: _height,
          width: _width,
          curve: Curves.easeInOut,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.05,
                ),

                //
                AnimatedContainer(
                  width: double.maxFinite,
                  height: _stackHeight,
                  // color: Colors.blue,
                  duration: const Duration(milliseconds: 500),
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: AnimatedOpacity(
                          opacity: _opacity,
                          duration: const Duration(milliseconds: 1000),
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      AnimatedPositioned(
                        right: _rightPosition,
                        top: _topPosition,
                        duration: const Duration(milliseconds: 600),
                        child: Container(
                          height: 100,
                          // duration: const Duration(milliseconds: 5000),
                          child: Image.asset("assets/images/wlogo.png"),
                        ),
                      ),
                      Positioned(
                        top: 35,
                        left: 0,
                        right: 0,
                        child: AnimatedBuilder(
                          animation: _heightAnimation,
                          builder: (context, child) {
                            return Container(
                              height: _heightAnimation.value,
                              child: Hero(
                                tag: widget.index,
                                child: Image.asset(
                                  BoseModelListClass.boseModelList[widget.index]
                                      .headPhoneImage!,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                // const Spacer(),

                Expanded(
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        bottom: _bottomPosition,
                        duration: const Duration(milliseconds: 1000),
                        child: Container(
                          // height: 300,
                          width: size.width * 0.93,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    color: Colors.grey.shade700,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 5),
                                    child: const Text(
                                      "LIMITED EDITION",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: FontSizes.smallerFont),
                                    ),
                                  ),
                                  Row(
                                    children: List.generate(3, (listIndex) {
                                      return Container(
                                        margin: const EdgeInsets.only(left: 5),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: listIndex != 0
                                                    ? AppColors.primaryColor
                                                    : colors[listIndex],
                                                width: 2),
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        height: 25,
                                        width: 25,
                                        child: Container(
                                          margin: const EdgeInsets.all(2),
                                          height: 15,
                                          width: 15,
                                          decoration: BoxDecoration(
                                            color: colors[listIndex],
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                        ),
                                      );
                                    }),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.03,
                              ),
                              SizedBox(
                                width: size.width * 0.95,
                                child: Text(
                                  BoseModelListClass
                                      .boseModelList[widget.index].headPhoneName!,
                                  textAlign: TextAlign.left,
                                  softWrap: true,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: FontSizes.biggerFont),
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.04,
                              ),
                              SizedBox(
                                child: Container(
                                  width: size.width * 0.40,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 12),
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const Icon(
                                        Icons.shopping_cart,
                                        color: Colors.black,
                                      ),
                                      Text(
                                        BoseModelListClass
                                            .boseModelList[widget.index]
                                            .headPhonePrice!,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: FontSizes.smallMediumFont),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.07,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final List<Color> colors = [
    Colors.grey,
    Colors.purple,
    Colors.yellow,
  ];
}
