import 'package:flutter/material.dart';
import 'package:super_heroes/providers/superhero_provider.dart';
import 'package:super_heroes/views/screens/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      useMaterial3: true,
    ),
    debugShowCheckedModeBanner: false,
    home: ChangeNotifierProvider(
      create: (_) => SuperHeroesProvider(),
      child: const Home(),
    ),
  ));
}
