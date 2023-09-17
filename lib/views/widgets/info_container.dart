import 'package:flutter/material.dart';
import 'package:super_heroes/utils/extensions.dart';

class InfoContainer extends StatelessWidget {
  double? heightPercentage;
  Widget? child;
  InfoContainer({this.heightPercentage, this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromRGBO(246, 246, 246, 0.65),
        border: Border.all(color: Colors.white),
      ),
      height: context.screenHeight * heightPercentage!,
      child: child,
    );
  }
}
