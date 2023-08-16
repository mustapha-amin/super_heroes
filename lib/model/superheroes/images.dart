import 'package:collection/collection.dart';

class Images {
	String? xs;
	String? sm;
	String? md;
	String? lg;

	Images({this.xs, this.sm, this.md, this.lg});

	factory Images.fromJson(Map<String, dynamic> json) => Images(
				xs: json['xs'] as String?,
				sm: json['sm'] as String?,
				md: json['md'] as String?,
				lg: json['lg'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'xs': xs,
				'sm': sm,
				'md': md,
				'lg': lg,
			};

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Images) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode => xs.hashCode ^ sm.hashCode ^ md.hashCode ^ lg.hashCode;
}
