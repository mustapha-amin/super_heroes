import 'package:collection/collection.dart';

class Work {
	String? occupation;
	String? base;

	Work({this.occupation, this.base});

	factory Work.fromJson(Map<String, dynamic> json) => Work(
				occupation: json['occupation'] as String?,
				base: json['base'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'occupation': occupation,
				'base': base,
			};

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Work) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode => occupation.hashCode ^ base.hashCode;
}
