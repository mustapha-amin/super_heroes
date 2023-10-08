import 'package:flutter/material.dart';
import 'package:super_heroes/utils/extensions.dart';
import 'package:super_heroes/utils/textstyle.dart';

class AppearanceWidget extends StatelessWidget {
  String title;
  String value;
  Widget icon;
  AppearanceWidget(
      {super.key,
      required this.title,
      required this.value,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth * .27,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(129, 129, 129, 0.25),
          ),
        ],
      ),
      margin: const EdgeInsets.all(4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            title,
            style: kTextStyle(13),
          ),
          icon,
          Text(
            value,
            style: kTextStyle(12),
          )
        ],
      ),
    );
  }
}
