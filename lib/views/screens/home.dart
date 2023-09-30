import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_heroes/models/superhero.dart';
import 'package:super_heroes/utils/extensions.dart';
import 'package:super_heroes/utils/navigation.dart';
import 'package:super_heroes/utils/textstyle.dart';
import 'package:super_heroes/views/screens/detail_screen.dart';
import 'package:super_heroes/views/screens/search_screen.dart';
import 'package:super_heroes/views/widgets/segmented_button.dart';
import '../../providers/superhero_provider.dart';
import '../../providers/segmented_btn_controller.dart';
import '../widgets/superhero_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ScrollController _scrollController = ScrollController();
  int chipIndex = 0;
  bool maleIsSelected = true;
  bool _fabVisible = false;
  List<String> categories = [
    "All",
    "Marvel Comics",
    "DC Comics",
    "Dark Horse Comics"
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SuperHeroesProvider>().fetchSuperheroes();
    });
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    if (_scrollController.offset > 100) {
      setState(() {
        _fabVisible = true;
      });
    } else {
      setState(() {
        _fabVisible = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var superHeroesProvider = Provider.of<SuperHeroesProvider>(context);
    var segmentedBtnCtrl = Provider.of<SegmentedButtonController>(context);
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF6F6F6),
        elevation: 0,
        title: Text(
          "SuperHeroes",
          style: kTextStyle(30,
              fontWeight: FontWeight.bold, color: const Color(0xFFB18C27)),
        ),
        actions: [
          Hero(
            tag: 'search',
            child: GestureDetector(
              onTap: () => superHeroesProvider.superHeroes!.isEmpty
                  ? null
                  : navigateTo(
                      context,
                      SearchScreen(
                        superHeroes: superHeroesProvider.superHeroes,
                      ),
                    ),
              child: Container(
                width: 35,
                margin: const EdgeInsets.only(right: 20),
                //padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFFFF1CB),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/search.png',
                    width: 25,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: superHeroesProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : !superHeroesProvider.errorMessageIsEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        size: 70,
                        color: Color(0xFFB18C27),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        superHeroesProvider.errorMessage ?? "",
                        textAlign: TextAlign.center,
                        style: kTextStyle(17),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          superHeroesProvider.fetchSuperheroes();
                        },
                        icon: const Icon(Icons.refresh),
                        label: Text(
                          "Refresh",
                          style: kTextStyle(
                            18,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              : Column(
                  children: [
                    Column(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                ...categories.map(
                                  (category) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 3),
                                    child: ChoiceChip(
                                      elevation: 3,
                                      side: BorderSide(
                                        width: chipIndex ==
                                                categories.indexOf(category)
                                            ? 1
                                            : 0,
                                        color: const Color(0xFFBFBFBF),
                                      ),
                                      selectedColor: const Color(0xFFFFF1CB),
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(24),
                                      ),
                                      label: Text(category),
                                      selected: chipIndex ==
                                          categories.indexOf(category),
                                      onSelected: (selected) {
                                        setState(() {
                                          chipIndex = selected
                                              ? categories.indexOf(category)
                                              : chipIndex;
                                        });

                                        switch (chipIndex) {
                                          case 0:
                                            superHeroesProvider.sort(
                                                superHeroesProvider
                                                    .superHeroes!);
                                            break;
                                          case 1:
                                            superHeroesProvider.sort(
                                                superHeroesProvider.superHeroes!
                                                    .where((hero) =>
                                                        hero.biography!
                                                            .publisher ==
                                                        'Marvel Comics')
                                                    .toList());
                                            break;
                                          case 2:
                                            superHeroesProvider.sort(
                                                superHeroesProvider.superHeroes!
                                                    .where((hero) =>
                                                        hero.biography!
                                                            .publisher ==
                                                        'DC Comics')
                                                    .toList());
                                            break;
                                          default:
                                            superHeroesProvider.sort(
                                                superHeroesProvider.superHeroes!
                                                    .where((hero) =>
                                                        hero.biography!
                                                            .publisher ==
                                                        'Dark Horse Comics')
                                                    .toList());
                                        }
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const CustomSegmentedButton()
                      ],
                    ),
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async =>
                            superHeroesProvider.fetchSuperheroes(),
                        child: ListView.builder(
                            controller: _scrollController,
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.symmetric(horizontal: 3),
                            itemCount: segmentedBtnCtrl.maleIsSelected
                                ? superHeroesProvider.sortedSuperHeroes!
                                    .where((hero) =>
                                        hero.appearance!.gender == "Male")
                                    .length
                                : superHeroesProvider.sortedSuperHeroes!
                                    .where((hero) =>
                                        hero.appearance!.gender == "Female")
                                    .length,
                            itemBuilder: (context, index) {
                              SuperHero superHero = segmentedBtnCtrl
                                      .maleIsSelected
                                  ? superHeroesProvider.sortedSuperHeroes!
                                      .where((hero) =>
                                          hero.appearance!.gender == "Male")
                                      .toList()[index]
                                  : superHeroesProvider.sortedSuperHeroes!
                                      .where((hero) =>
                                          hero.appearance!.gender == "Female")
                                      .toList()[index];

                              return SuperHeroCard(
                                superHero: superHero,
                              );
                            }),
                      ),
                    ),
                  ],
                ),
      floatingActionButton: !_fabVisible
          ? const SizedBox()
          : FloatingActionButton(
              elevation: 2,
              backgroundColor: const Color(0xFFFFF1CB),
              onPressed: () {
                _scrollController.animateTo(0.0,
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastEaseInToSlowEaseOut);
              },
              child: const Icon(Icons.arrow_upward_rounded),
            ),
    );
  }
}
