import 'package:collection/collection.dart';

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
				height: json['height'] as List<String>?,
				weight: json['weight'] as List<String>?,
				eyeColor: json['eyeColor'] as String?,
				hairColor: json['hairColor'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'gender': gender,
				'race': race,
				'height': height,
				'weight': weight,
				'eyeColor': eyeColor,
				'hairColor': hairColor,
			};

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Appearance) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode =>
			gender.hashCode ^
			race.hashCode ^
			height.hashCode ^
			weight.hashCode ^
			eyeColor.hashCode ^
			hairColor.hashCode;
}
