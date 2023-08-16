import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_heroes/models/superhero.dart';
import 'package:super_heroes/utils/navigation.dart';
import 'package:super_heroes/utils/textstyle.dart';
import 'package:super_heroes/views/screens/search_screen.dart';
import '../../../service/http_service.dart';
import '../../providers/superhero_provider.dart';
import '../widgets/superhero_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "SuperHeroes",
          style: kTextStyle(30, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              navigateTo(
                context,
                SearchScreen(
                  superHeroes: superHeroesProvider.superHeroes,
                ),
              );
            },
            icon: const Icon(
              Icons.search,
              size: 30,
            ),
          )
        ],
      ),
      body: superHeroesProvider.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: superHeroesProvider.superHeroes!.length,
              itemBuilder: (context, index) {
                SuperHero superHero = superHeroesProvider.superHeroes![index];
                return SuperHeroCard(
                  superHero: superHero,
                );
              },
            ),
    );
  }
}
