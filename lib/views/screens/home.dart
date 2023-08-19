import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_heroes/models/superhero.dart';
import 'package:super_heroes/utils/extensions.dart';
import 'package:super_heroes/utils/navigation.dart';
import 'package:super_heroes/utils/textstyle.dart';
import 'package:super_heroes/views/screens/search_screen.dart';
import '../../providers/superhero_provider.dart';
import '../widgets/superhero_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  List<String> categories = [
    "All",
    "Marvel Comics",
    "DC Comics",
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SuperHeroesProvider>().fetchSuperheroes();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var superHeroesProvider = Provider.of<SuperHeroesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "SuperHeroes",
          style: kTextStyle(30,
              fontWeight: FontWeight.bold, color: const Color(0xFFB18C27)),
        ),
        actions: [
          GestureDetector(
            onTap: () => navigateTo(
                context,
                SearchScreen(
                  superHeroes: superHeroesProvider.superHeroes,
                )),
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
        ],
      ),
      body: superHeroesProvider.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                SizedBox(
                  height: context.screenHeight * .20,
                  child: Column(
                    children: [
                      Wrap(
                        spacing: 8,
                        children: [
                          ...categories.map(
                            (category) => ChoiceChip(
                              elevation: 3,
                              side: BorderSide(
                                width: index == categories.indexOf(category)
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
                              selected: index == categories.indexOf(category),
                              onSelected: (selected) {
                                setState(() {
                                  index = selected
                                      ? categories.indexOf(category)
                                      : index;
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    itemCount: superHeroesProvider.superHeroes!.length,
                    itemBuilder: (context, index) {
                      SuperHero superHero =
                          superHeroesProvider.superHeroes![index];
                      return SuperHeroCard(
                        superHero: superHero,
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
