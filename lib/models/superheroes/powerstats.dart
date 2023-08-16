import 'package:collection/collection.dart';

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

	Map<String, dynamic> toJson() => {
				'intelligence': intelligence,
				'strength': strength,
				'speed': speed,
				'durability': durability,
				'power': power,
				'combat': combat,
			};

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Powerstats) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode =>
			intelligence.hashCode ^
			strength.hashCode ^
			speed.hashCode ^
			durability.hashCode ^
			power.hashCode ^
			combat.hashCode;
}
