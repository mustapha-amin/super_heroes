import 'package:collection/collection.dart';

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
				aliases: json['aliases'] as List<String>?,
				placeOfBirth: json['placeOfBirth'] as String?,
				firstAppearance: json['firstAppearance'] as String?,
				publisher: json['publisher'] as String?,
				alignment: json['alignment'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'fullName': fullName,
				'alterEgos': alterEgos,
				'aliases': aliases,
				'placeOfBirth': placeOfBirth,
				'firstAppearance': firstAppearance,
				'publisher': publisher,
				'alignment': alignment,
			};

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Biography) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode =>
			fullName.hashCode ^
			alterEgos.hashCode ^
			aliases.hashCode ^
			placeOfBirth.hashCode ^
			firstAppearance.hashCode ^
			publisher.hashCode ^
			alignment.hashCode;
}
