import 'package:flutter/material.dart';
import 'package:super_heroes/service/http_service.dart';

import '../models/superhero.dart';

class SuperHeroesProvider extends ChangeNotifier {
  List<SuperHero>? superHeroes = [];
  List<SuperHero>? sortedSuperHeroes = [];
  bool isLoading = false;

  void toggleLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void fetchSuperheroes() async {
    toggleLoading();
    superHeroes = await HttpService.getSuperheroes();
    sortedSuperHeroes!.addAll(superHeroes!);
    toggleLoading();
  }

  void sort(List<SuperHero> sortingMechanism) {
    sortedSuperHeroes = sortingMechanism;
    notifyListeners();
  }
}
