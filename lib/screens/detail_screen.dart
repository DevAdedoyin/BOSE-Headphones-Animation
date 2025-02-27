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

class _DetailScreenState extends State<DetailScreen> {
  double _leftPosition = -200;
  double _rightPosition = 10;
  Color _color = Colors.white;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(100);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _color = _color == Colors.white ? Colors.black : Colors.white;

    _borderRadius = BorderRadius.circular(1);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      // backgroundColor: Colors.black,
      body: AnimatedContainer(
        decoration: BoxDecoration(color: _color, borderRadius: _borderRadius),
        duration: const Duration(milliseconds: 5000),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.05,
              ),

              //
              SizedBox(
                width: double.maxFinite,
                height: size.height * 0.6,
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      right: _rightPosition,
                      child: SizedBox(
                        height: 100,
                        child: Image.asset("assets/images/wlogo.png"),
                      ),
                    ),
                    Positioned(
                      top: 35,
                      left: 0,
                      right: 0,
                      child: SizedBox(
                        height: size.height * 0.55,
                        child: Image.asset(
                          BoseModelListClass
                              .boseModelList[widget.index].headPhoneImage!,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //
              SizedBox(
                height: size.height * 0.02,
              ),

              //
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: Colors.grey.shade700,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
                            borderRadius: BorderRadius.circular(20)),
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

              //
              SizedBox(
                height: size.height * 0.03,
              ),

              //
              SizedBox(
                width: double.maxFinite,
                child: Text(
                  BoseModelListClass.boseModelList[widget.index].headPhoneName!,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: FontSizes.biggerFont),
                ),
              ),

              //
              SizedBox(
                height: size.height * 0.04,
              ),

              //
              SizedBox(
                child: Container(
                  width: size.width * 0.40,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(
                        Icons.shopping_cart,
                        color: Colors.black,
                      ),
                      Text(
                        BoseModelListClass
                            .boseModelList[widget.index].headPhonePrice!,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: FontSizes.smallMediumFont),
                      )
                    ],
                  ),
                ),
              )
            ],
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
