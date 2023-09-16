import 'package:flutter/material.dart';
import 'package:super_heroes/utils/extensions.dart';
import 'package:super_heroes/utils/textstyle.dart';
import 'package:super_heroes/views/widgets/powerstats.dart';

import '../../models/superhero.dart';

class SuperHeroDetailPage extends StatefulWidget {
  SuperHero? superHero;
  SuperHeroDetailPage({super.key, this.superHero});

  @override
  State<SuperHeroDetailPage> createState() => _SuperHeroDetailPageState();
}

class _SuperHeroDetailPageState extends State<SuperHeroDetailPage> {
  List<String> options = [
    'PowerStats',
    'Appearance',
    'Biography',
    'Work',
    'Connections',
  ];

  List<String> powerstats = [
    'Intelligence',
    'Strength',
    'Speed',
    'Durability',
    'Power',
    'Combat'
  ];

  String selectedOption = 'PowerStats';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
                image: NetworkImage(
                  widget.superHero!.images!.lg!,
                ),
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 3,
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: const CircleBorder(
                      side: BorderSide(color: Colors.white, width: 3)),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                )),
          ),
          Positioned(
            top: 40,
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 255, 255, 0.75),
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(color: Colors.white, width: 2.0)),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    widget.superHero!.name!,
                    style: kTextStyle(
                      28,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFB18C27),
                    ),
                  ),
                  Text(
                    widget.superHero!.biography!.publisher!,
                    style: kTextStyle(12, color: const Color(0xFFB18C27)),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 255, 255, 0.75),
                    borderRadius: BorderRadius.circular(32),
                    border: Border.all(color: Colors.white, width: 2.0),
                  ),
                  child: Row(
                    children: options
                        .map(
                          (option) => Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 7),
                            child: RawChip(
                              showCheckmark: false,
                              avatar: selectedOption == option
                                  ? CircleAvatar(
                                      foregroundColor: Colors.white,
                                      backgroundColor: switch (selectedOption) {
                                        "PowerStats" => Colors.grey,
                                        "Appearance" => Colors.green,
                                        "Biography" => Colors.amber,
                                        "Work" => Colors.blue,
                                        _ => Colors.red,
                                      })
                                  : null,
                              selectedColor: Colors.white,
                              shape: selectedOption == option
                                  ? RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    )
                                  : const CircleBorder(),
                              label: selectedOption == option
                                  ? Row(
                                      children: [
                                        Text(option),
                                      ],
                                    )
                                  : SizedBox(
                                      child: Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: switch (option) {
                                              "PowerStats" => Colors.grey,
                                              "Appearance" => Colors.green,
                                              "Biography" => Colors.amber,
                                              "Work" => Colors.blue,
                                              _ => Colors.red,
                                            }),
                                      ),
                                    ),
                              selected: selectedOption == option,
                              onSelected: (isSelected) {
                                setState(() {
                                  if (isSelected) {
                                    selectedOption = option;
                                  } else {
                                    selectedOption = '';
                                  }
                                });
                              },
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 300,
            height: 460,
            color: const Color.fromRGBO(255, 255, 255, 0.75),
            padding: const EdgeInsets.all(20),
            margin: EdgeInsets.only(top: 420),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, mainAxisSpacing: 2, crossAxisSpacing: 2),
              itemCount: powerstats.length,
              itemBuilder: (context, index) {
                return PowerStats(
                  title: powerstats[index],
                  value: switch (powerstats[index]) {
                    'Intelligence' =>
                      widget.superHero!.powerstats!.intelligence!,
                    'Strength' => widget.superHero!.powerstats!.strength!,
                    'Speed' => widget.superHero!.powerstats!.strength!,
                    'Durability' => widget.superHero!.powerstats!.durability!,
                    'Power' => widget.superHero!.powerstats!.power!,
                    _ => widget.superHero!.powerstats!.combat!,
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
