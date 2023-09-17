import 'package:flutter/material.dart';
import 'package:super_heroes/models/superhero.dart';
import 'package:super_heroes/views/widgets/appearance_widget.dart';

class AppearanceContainer extends StatelessWidget {
  Appearance appearance;
  AppearanceContainer({required this.appearance, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppearanceWidget(
                title: "Gender",
                value: appearance.gender!,
                icon: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.male),
                    Icon(Icons.female),
                  ],
                ),
              ),
              AppearanceWidget(
                title: "Race",
                value: appearance.race!,
                icon: Image.asset(
                  'assets/race.png',
                  color: Colors.black,
                ),
              ),
              AppearanceWidget(
                title: "Height",
                value: appearance.height![0],
                icon: Image.asset(
                  'assets/height.png',
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppearanceWidget(
                title: "Weight",
                value: appearance.weight![0],
                icon: Image.asset(
                  'assets/weight.png',
                  color: Colors.black,
                ),
              ),
              AppearanceWidget(
                title: "Eye color",
                value: appearance.eyeColor!,
                icon: Icon(Icons.visibility),
              ),
              AppearanceWidget(
                title: "Hair",
                value: appearance.hairColor!,
                icon: Icon(Icons.palette),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
