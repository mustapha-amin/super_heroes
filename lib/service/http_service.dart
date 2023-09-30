import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:super_heroes/models/superhero.dart';

const url = "https://akabab.github.io/superhero-api/api/all.json";

class HttpService {
  static Future<List<SuperHero>?> getSuperheroes() async {
    Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> json = jsonDecode(response.body);
      List<SuperHero> superheroes =
          json.map((hero) => SuperHero.fromJson(hero)).toList();
      // log(response.body);
      return superheroes;
    } else {
      throw const SocketException(
          "Unable to fetch data\nPlease check your network settings");
    }
  }
}
