import 'package:flutter/material.dart';
import 'package:super_heroes/models/superhero.dart';
import 'package:super_heroes/utils/extensions.dart';
import 'package:super_heroes/views/widgets/powerstats.dart';

class PowerStatsContainer extends StatelessWidget {
  Powerstats powerstats;
  PowerStatsContainer({required this.powerstats, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PowerStatsWidget(
                title: "Intelligence",
                value: powerstats.intelligence!,
                icon: Icons.lightbulb_outline,
              ),
              PowerStatsWidget(
                title: "Strength",
                value: powerstats.strength!,
                icon: Icons.fitness_center,
              ),
              PowerStatsWidget(
                title: "Speed",
                value: powerstats.speed!,
                icon: Icons.directions_run,
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PowerStatsWidget(
                title: "Durability",
                value: powerstats.durability!,
                icon: Icons.shield,
              ),
              PowerStatsWidget(
                title: "Power",
                value: powerstats.power!,
                icon: Icons.flash_on,
              ),
              PowerStatsWidget(
                title: "Combat",
                value: powerstats.combat!,
                icon: Icons.sports_martial_arts,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
