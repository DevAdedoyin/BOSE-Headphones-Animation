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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
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
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new),
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
            )
          ],
        ),
      ),
    );
  }
}
