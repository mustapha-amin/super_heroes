class SuperHero {
  int? id;
  String? name;
  String? slug;
  Powerstats? powerstats;
  Appearance? appearance;
  Biography? biography;
  Work? work;
  Connections? connections;
  Images? images;

  SuperHero({
    this.id,
    this.name,
    this.slug,
    this.powerstats,
    this.appearance,
    this.biography,
    this.work,
    this.connections,
    this.images,
  });

  factory SuperHero.fromJson(Map<String, dynamic> json) => SuperHero(
        id: json['id'] as int?,
        name: json['name'] as String?,
        slug: json['slug'] as String?,
        powerstats: Powerstats.fromJson(json['powerstats'] as Map<String, dynamic>),
        appearance: Appearance.fromJson(json['appearance'] as Map<String, dynamic>),
        biography: Biography.fromJson(json['biography'] as Map<String, dynamic>),
        work: Work.fromJson(json['work'] as Map<String, dynamic>),
        connections: Connections.fromJson(json['connections'] as Map<String, dynamic>),
        images: Images.fromJson(json['images'] as Map<String, dynamic>),
      );
}

class Appearance {
  String? gender;
  String? race;
  List<String>? height;
  List<String>? weight;
  String? eyeColor;
  String? hairColor;

  Appearance({
    this.gender,
    this.race,
    this.height,
    this.weight,
    this.eyeColor,
    this.hairColor,
  });

  factory Appearance.fromJson(Map<String, dynamic> json) => Appearance(
        gender: json['gender'] as String?,
        race: json['race'] as String?,
        height: List<String>.from(json['height'] as List<dynamic>),
        weight: List<String>.from(json['weight'] as List<dynamic>),
        eyeColor: json['eyeColor'] as String?,
        hairColor: json['hairColor'] as String?,
      );
}

class Biography {
  String? fullName;
  String? alterEgos;
  List<String>? aliases;
  String? placeOfBirth;
  String? firstAppearance;
  String? publisher;
  String? alignment;

  Biography({
    this.fullName,
    this.alterEgos,
    this.aliases,
    this.placeOfBirth,
    this.firstAppearance,
    this.publisher,
    this.alignment,
  });

  factory Biography.fromJson(Map<String, dynamic> json) => Biography(
        fullName: json['fullName'] as String?,
        alterEgos: json['alterEgos'] as String?,
        aliases: List<String>.from(json['aliases'] as List<dynamic>),
        placeOfBirth: json['placeOfBirth'] as String?,
        firstAppearance: json['firstAppearance'] as String?,
        publisher: json['publisher'] as String?,
        alignment: json['alignment'] as String?,
      );
}

class Connections {
  String? groupAffiliation;
  String? relatives;

  Connections({
    this.groupAffiliation,
    this.relatives,
  });

  factory Connections.fromJson(Map<String, dynamic> json) => Connections(
        groupAffiliation: json['groupAffiliation'] as String?,
        relatives: json['relatives'] as String?,
      );
}

class Images {
  String? xs;
  String? sm;
  String? md;
  String? lg;

  Images({
    this.xs,
    this.sm,
    this.md,
    this.lg,
  });

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        xs: json['xs'] as String?,
        sm: json['sm'] as String?,
        md: json['md'] as String?,
        lg: json['lg'] as String?,
      );
}

class Powerstats {
  int? intelligence;
  int? strength;
  int? speed;
  int? durability;
  int? power;
  int? combat;

  Powerstats({
    this.intelligence,
    this.strength,
    this.speed,
    this.durability,
    this.power,
    this.combat,
  });

  factory Powerstats.fromJson(Map<String, dynamic> json) => Powerstats(
        intelligence: json['intelligence'] as int?,
        strength: json['strength'] as int?,
        speed: json['speed'] as int?,
        durability: json['durability'] as int?,
        power: json['power'] as int?,
        combat: json['combat'] as int?,
      );
}

class Work {
  String? occupation;
  String? base;

  Work({
    this.occupation,
    this.base,
  });

  factory Work.fromJson(Map<String, dynamic> json) => Work(
        occupation: json['occupation'] as String?,
        base: json['base'] as String?,
      );
}
