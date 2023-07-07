class Snow {
	double? onehour;

	Snow({this.onehour});

	factory Snow.fromJson(Map<String, dynamic> json) => Snow(
				onehour: (json['1h'] as num?)?.toDouble(),
			);

	Map<String, dynamic> toJson() => {
				'1h': onehour,
			};
}
