import 'package:flutter/material.dart';
import 'package:super_heroes/service/http_service.dart';

import '../models/superhero.dart';

class SuperHeroesProvider extends ChangeNotifier {
  List<SuperHero>? superHeroes = [];
  List<SuperHero>? sortedSuperHeroes = [];
  bool isLoading = false;
  String? errorMessage;

  bool get errorMessageIsEmpty => errorMessage == "";

  void toggleLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void fetchSuperheroes() async {
    toggleLoading();
    errorMessage = null;
    superHeroes!.clear();
    sortedSuperHeroes!.clear();
    try {
      superHeroes = await HttpService.getSuperheroes();
      sortedSuperHeroes!.addAll(superHeroes!);
      errorMessage = "";
    } catch (e) {
      errorMessage = "Unable to fetch data";
    }
    toggleLoading();
  }

  void sort(List<SuperHero> sortingMechanism) {
    sortedSuperHeroes = sortingMechanism;
    notifyListeners();
  }
}