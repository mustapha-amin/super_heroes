import 'package:collection/collection.dart';

class Connections {
	String? groupAffiliation;
	String? relatives;

	Connections({this.groupAffiliation, this.relatives});

	factory Connections.fromJson(Map<String, dynamic> json) => Connections(
				groupAffiliation: json['groupAffiliation'] as String?,
				relatives: json['relatives'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'groupAffiliation': groupAffiliation,
				'relatives': relatives,
			};

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Connections) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode => groupAffiliation.hashCode ^ relatives.hashCode;
}
