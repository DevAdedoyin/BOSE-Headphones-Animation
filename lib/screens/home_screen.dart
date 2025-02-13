import 'package:bose_ecommerce_animation/constants/colors.dart';
import 'package:bose_ecommerce_animation/constants/font_sizes.dart';
import 'package:bose_ecommerce_animation/model/bose_mode.dart';
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
              fit: FlexFit.tight,
              child: GridView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1 / 1.5,
                      crossAxisCount: 2,
                      mainAxisSpacing: 7,
                      crossAxisSpacing: 5),
                  itemCount: 4,
                  itemBuilder: (_, index) {
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 800, ),
                      child: Card(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                child: Image.asset(
                                  BoseModelListClass
                                      .boseModelList[index].headPhoneImage!,
                                  height: 120,
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.37,
                                child: Text(
                                  BoseModelListClass
                                      .boseModelList[index].headPhoneName!,
                                  style: const TextStyle(
                                      fontSize: FontSizes.smallMediumFont,
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Text(BoseModelListClass
                                    .boseModelList[index].headPhonePrice!,  style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w900),),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
