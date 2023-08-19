import 'package:flutter/material.dart';
import 'package:super_heroes/providers/segmented_btn_controller.dart';
import 'package:super_heroes/providers/superhero_provider.dart';
import 'package:super_heroes/views/screens/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      useMaterial3: true,
    ),
    debugShowCheckedModeBanner: false,
    home: MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => SuperHeroesProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => SegmentedButtonController(),
      ),
    ], child: const Home()),
  ));
}
