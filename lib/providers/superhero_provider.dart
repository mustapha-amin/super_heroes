import 'package:flutter/material.dart';
import 'package:super_heroes/service/http_service.dart';

import '../models/superhero.dart';

class SuperHeroesProvider extends ChangeNotifier {

  List<SuperHero>? superHeroes = [];
  bool isLoading = false;

  void toggleLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void fetchSuperheroes() async {
    toggleLoading();
    superHeroes = await HttpService.getSuperheroes();
    toggleLoading();
  }

}
