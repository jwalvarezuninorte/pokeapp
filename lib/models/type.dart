import 'package:pokeapp/models/common_type.dart';

class Type {
  final int? slot;
  final CommonType type;

  Type({
    this.slot,
    required this.type,
  });

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        slot: json["slot"],
        type: CommonType.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "slot": slot,
        "type": type?.toJson(),
      };
}
