import 'package:collection/collection.dart';

import 'appearance.dart';
import 'biography.dart';
import 'connections.dart';
import 'images.dart';
import 'powerstats.dart';
import 'work.dart';

class Superhero {
	int? id;
	String? name;
	String? slug;
	Powerstats? powerstats;
	Appearance? appearance;
	Biography? biography;
	Work? work;
	Connections? connections;
	Images? images;

	Superhero({
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

	factory Superhero.fromJson(Map<String, dynamic> json) => Superhero(
				id: json['id'] as int?,
				name: json['name'] as String?,
				slug: json['slug'] as String?,
				powerstats: json['powerstats'] == null
						? null
						: Powerstats.fromJson(json['powerstats'] as Map<String, dynamic>),
				appearance: json['appearance'] == null
						? null
						: Appearance.fromJson(json['appearance'] as Map<String, dynamic>),
				biography: json['biography'] == null
						? null
						: Biography.fromJson(json['biography'] as Map<String, dynamic>),
				work: json['work'] == null
						? null
						: Work.fromJson(json['work'] as Map<String, dynamic>),
				connections: json['connections'] == null
						? null
						: Connections.fromJson(json['connections'] as Map<String, dynamic>),
				images: json['images'] == null
						? null
						: Images.fromJson(json['images'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
				'slug': slug,
				'powerstats': powerstats?.toJson(),
				'appearance': appearance?.toJson(),
				'biography': biography?.toJson(),
				'work': work?.toJson(),
				'connections': connections?.toJson(),
				'images': images?.toJson(),
			};

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Superhero) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode =>
			id.hashCode ^
			name.hashCode ^
			slug.hashCode ^
			powerstats.hashCode ^
			appearance.hashCode ^
			biography.hashCode ^
			work.hashCode ^
			connections.hashCode ^
			images.hashCode;
}
