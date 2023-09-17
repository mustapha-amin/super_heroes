import 'package:flutter/material.dart';
import 'package:super_heroes/utils/extensions.dart';
import 'package:super_heroes/utils/textstyle.dart';

class PowerStatsWidget extends StatelessWidget {
  String title;
  int value;
  IconData icon;
  PowerStatsWidget({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

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
          Icon(icon),
          Text(
            title,
            style: kTextStyle(16),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: context.screenWidth * .14,
                height: context.screenWidth * .14,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation(Colors.black),
                  value: value / 100.toDouble(),
                ),
              ),
              Text(
                '$value%',
                style: kTextStyle(15),
              ),
            ],
          ),
          const SizedBox(
            height: 2,
          )
        ],
      ),
    );
  }
}
