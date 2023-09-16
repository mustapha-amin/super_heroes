import 'package:flutter/material.dart';

import '../../models/superhero.dart';
import '../../utils/navigation.dart';
import '../../utils/textstyle.dart';
import '../screens/detail_screen.dart';

class SuperHeroCard extends StatelessWidget {
  const SuperHeroCard({
    super.key,
    required this.superHero,
  });

  final SuperHero superHero;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        navigateTo(context, SuperHeroDetailPage(superHero: superHero,));

      },
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: NetworkImage(superHero.images!.lg!),
      ),
      title: Text(
        superHero.name!,
        style: kTextStyle(20, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(superHero.biography!.publisher ?? ''),
      trailing: const Icon(
        Icons.info_outline_rounded,
        color: Colors.grey,
      ),
    );
  }
}
