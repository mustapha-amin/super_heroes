import 'package:flutter/material.dart';

import '../../models/superheroes/superheroes.dart';
import '../../../service/http_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Superhero>?> superheroes;

  @override
  void initState() {
    superheroes = HttpService().getSuperheroes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          HttpService().getSuperheroes();
        },
      ),
    );
  }
}
