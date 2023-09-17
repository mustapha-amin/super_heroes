import 'package:flutter/material.dart';
import 'package:super_heroes/utils/extensions.dart';
import 'package:super_heroes/views/widgets/powerstats_container.dart';

import '../screens/detail_screen.dart';
import 'appearance_container.dart';
import 'datalist.dart';
import 'info_container.dart';

class SuperHeroData extends StatelessWidget {
  const SuperHeroData({
    super.key,
    required this.selectedOption,
    required this.scrollController2,
    required this.scrollController1,
    required this.widget,
  });

  final String selectedOption;
  final ScrollController scrollController2;
  final ScrollController scrollController1;
  final SuperHeroDetailPage widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: context.screenHeight * .03,
            ),
            switch (selectedOption) {
              "Connections" => Column(
                  children: [
                    InfoContainer(
                      heightPercentage: .2,
                      child: SizedBox(
                        child: RawScrollbar(
                          thickness: 4,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          thumbColor: const Color(0xFF012045),
                          radius: const Radius.circular(13),
                          controller: scrollController2,
                          trackVisibility: true,
                          thumbVisibility: true,
                          trackColor: const Color.fromRGBO(255, 255, 255, 0.50),
                          child: SingleChildScrollView(
                            controller: scrollController1,
                            child: DataList.noTitle(
                              widget.superHero!.connections!.groupAffiliation!
                                  .split(', '),
                              "Group Affiliation",
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InfoContainer(
                      heightPercentage: .2,
                      child: RawScrollbar(
                        thickness: 4,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        thumbColor: const Color(0xFF012045),
                        radius: const Radius.circular(13),
                        controller: scrollController2,
                        trackVisibility: true,
                        thumbVisibility: true,
                        trackColor: const Color.fromRGBO(255, 255, 255, 0.50),
                        child: SingleChildScrollView(
                          controller: scrollController2,
                          child: DataList.noTitle(
                            widget.superHero!.connections!.relatives!
                                .split(', '),
                            "Group Affiliation",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              _ => InfoContainer(
                  heightPercentage: switch (selectedOption) {
                    "PowerStats" || "Appearance" => .45,
                    _ => .3
                  },
                  child: switch (selectedOption) {
                    "PowerStats" => PowerStatsContainer(
                        powerstats: widget.superHero!.powerstats!),
                    "Appearance" => AppearanceContainer(
                        appearance: widget.superHero!.appearance!,
                      ),
                    "Biography" => RawScrollbar(
                        thickness: 4,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        thumbColor: const Color(0xFF012045),
                        radius: const Radius.circular(13),
                        controller: scrollController1,
                        trackVisibility: true,
                        thumbVisibility: true,
                        trackColor: const Color.fromRGBO(255, 255, 255, 0.50),
                        child: SingleChildScrollView(
                          controller: scrollController1,
                          child: DataList(
                            titles: const [
                              "Full Name",
                              "Alter Egos",
                              "Aliases",
                              "P.O.B",
                              "1st Appearance"
                            ],
                            values: [
                              widget.superHero!.biography!.fullName!,
                              widget.superHero!.biography!.alterEgos!,
                              widget.superHero!.biography!.aliases,
                              widget.superHero!.biography!.placeOfBirth,
                              widget.superHero!.biography!.firstAppearance,
                            ],
                          ),
                        ),
                      ),
                    _ => Column(
                        children: [
                          DataList.noTitle(
                            widget.superHero!.work!.occupation!.split(', '),
                            "Occupation",
                          ),
                        ],
                      ),
                  },
                ),
            }
          ],
        ),
      ),
    );
  }
}
