import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:super_heroes/models/superheroes/superheroes.dart';

const url = "https://akabab.github.io/superhero-api/api/all.json";

class HttpService {
  Future<List<Superhero>?> getSuperheroes() async {
    Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> json = jsonDecode(response.body);
      List<Superhero> superheroes =
          json.map((hero) => Superhero.fromJson(hero)).toList();
      log(response.body);
      return superheroes;
    } else {
      throw ("Cant get data");
    }
  }
}
