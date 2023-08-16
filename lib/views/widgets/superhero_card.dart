import 'package:flutter/material.dart';

import '../../models/superhero.dart';
import '../../utils/textstyle.dart';

class SuperHeroCard extends StatelessWidget {
  const SuperHeroCard({
    super.key,
    required this.superHero,
  });

  final SuperHero superHero;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[300],
      child: ListTile(
        onTap: () {},
        contentPadding: const EdgeInsets.all(8),
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(superHero.images!.lg!),
        ),
        title: Text(
          superHero.name!,
          style: kTextStyle(20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
