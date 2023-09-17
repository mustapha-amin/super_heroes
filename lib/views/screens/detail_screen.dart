import 'package:flutter/material.dart';
import 'package:super_heroes/utils/extensions.dart';
import 'package:super_heroes/utils/textstyle.dart';
import 'package:super_heroes/views/widgets/appearance_container.dart';
import 'package:super_heroes/views/widgets/datalist.dart';
import 'package:super_heroes/views/widgets/info_container.dart';
import 'package:super_heroes/views/widgets/powerstats_container.dart';

import '../../models/superhero.dart';
import '../widgets/powerstats.dart';
import '../widgets/superhero_data.dart';

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
    ScrollController scrollController1 = ScrollController();
    ScrollController scrollController2 = ScrollController();
    return Scaffold(
      body: Container(
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: context.screenHeight * .2,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 40,
                      left: 3,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 14),
                          padding: const EdgeInsets.only(right: 2),
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                              size: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 40,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(255, 255, 255, 0.75),
                          border: Border.all(width: 2, color: Colors.white),
                          borderRadius: BorderRadius.circular(28),
                        ),
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
                              style: kTextStyle(
                                12,
                                color: const Color(0xFFB18C27),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: context.screenHeight * .2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: options
                      .map(
                        (option) => RawChip(
                          labelPadding:
                              const EdgeInsets.symmetric(horizontal: 2),
                          showCheckmark: false,
                          avatar: selectedOption == option
                              ? CircleAvatar(
                                  radius: 10,
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
                              ? Text(
                                  option,
                                  style: kTextStyle(13),
                                )
                              : SizedBox(
                                  height: 18,
                                  width: 18,
                                  child: Container(
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
                              }
                            });
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
              SizedBox(
                height: context.screenHeight * .55,
                child: SuperHeroData(
                  selectedOption: selectedOption,
                  scrollController2: scrollController2,
                  scrollController1: scrollController1,
                  widget: widget,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
