import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_heroes/models/superhero.dart';
import 'package:super_heroes/providers/superhero_provider.dart';
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
        // if (item.name!.startsWith(query)) {
        //   item. == query
        //       ? searchResult.insert(0, item)
        //       : searchResult.insert(0, item);
        // }
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
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: size.width * .9,
            height: size.height / 13,
            child: SearchBar(
                shape: const MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
                hintText: "super hero",
                hintStyle: MaterialStatePropertyAll(
                    kTextStyle(15, color: Colors.grey)),
                controller: controller,
                elevation: const MaterialStatePropertyAll(2),
                onChanged: (_) => search(controller.text)),
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
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
