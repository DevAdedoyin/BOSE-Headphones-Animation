import 'package:bose_ecommerce_animation/screens/detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/font_sizes.dart';
import '../model/bose_mode.dart';

class HomeGridItemWidget extends StatelessWidget {
  final int index;

  const HomeGridItemWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              index: index,
            ),
          ),
        );
      },
      child: SizedBox(
        width: size.width * 0.46,
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: size.height * 0.01,
                ),
                SizedBox(
                  child: Image.asset(
                    BoseModelListClass.boseModelList[index].headPhoneImage!,
                    height: 110,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                SizedBox(
                  width: size.width * 0.38,
                  child: Text(
                    BoseModelListClass.boseModelList[index].headPhoneName!,
                    style: const TextStyle(
                        fontSize: FontSizes.smallFont,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    BoseModelListClass.boseModelList[index].headPhonePrice!,
                    style: const TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
