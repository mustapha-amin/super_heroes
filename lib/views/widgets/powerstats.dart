import 'package:flutter/material.dart';

import '../../models/superhero.dart';

class PowerStats extends StatefulWidget {
  String title;
  int value;
  PowerStats({super.key, required this.title, required this.value});

  @override
  State<PowerStats> createState() => _PowerStatsState();
}

class _PowerStatsState extends State<PowerStats> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          SizedBox(height: 40),
          Text(widget.title),
          CircularProgressIndicator(
            backgroundColor: Colors.grey,
            valueColor: AlwaysStoppedAnimation(Colors.black),
            value: widget.value / 100.toDouble(),
          )
        ],
      ),
    );
  }
}
