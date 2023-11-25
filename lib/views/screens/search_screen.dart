import 'package:flutter/material.dart';
import 'package:super_heroes/models/superhero.dart';
import 'package:super_heroes/utils/textstyle.dart';
import 'package:super_heroes/views/widgets/superhero_card.dart';

class SearchScreen extends StatefulWidget {
  List<SuperHero>? superHeroes;
  SearchScreen({this.superHeroes, super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<SuperHero> searchResult = [];
  List<SuperHero> searchList = [];
  String query = '';
  late TextEditingController controller;

  void search(String query) {
    searchResult.clear();
    for (var item in searchList) {
      if (item.name!.toLowerCase().startsWith(query.toLowerCase()) &&
          controller.text.isNotEmpty) {
        searchResult.add(item);
      }
    }
    setState(() {});
  }

  @override
  void initState() {
    searchList = widget.superHeroes!;
    controller = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: const Color(0xFFB18C27),
        title: Hero(
          tag: "hero",
          child: Text(
            "SuperHero",
            style: kTextStyle(20,
                fontWeight: FontWeight.bold, color: const Color(0xFFB18C27)),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            width: size.width * .9,
            height: 38,
            child: Hero(
              tag: 'search',
              child: SearchBar(
                  textStyle: MaterialStatePropertyAll(
                    kTextStyle(
                      12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: [
                    Image.asset('assets/images/search.png'),
                  ],
                  backgroundColor:
                      const MaterialStatePropertyAll(Color(0xFFFFF1CB)),
                  shape: const MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(36),
                      ),
                    ),
                  ),
                  hintText: "Search Superhero",
                  hintStyle: MaterialStatePropertyAll(
                    kTextStyle(
                      12,
                      color: Colors.black,
                    ),
                  ),
                  controller: controller,
                  elevation: const MaterialStatePropertyAll(1),
                  onChanged: (_) => search(controller.text)),
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets. symmetric(horizontal: 10, vertical: 15),
              itemCount: searchResult.length,
              itemBuilder: (context, index) {
                return SuperHeroCard(superHero: searchResult[index]);
              }, 
            ),
          ),
        ],
      ),
    );
  }
}
