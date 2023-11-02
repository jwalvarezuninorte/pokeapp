import 'package:pokeapp/models/common_type.dart';

class Move {
  final CommonType? move;

  Move({
    this.move,
  });

  factory Move.fromJson(Map<String, dynamic> json) => Move(
        move: json["move"] == null ? null : CommonType.fromJson(json["move"]),
      );

  Map<String, dynamic> toJson() => {
        "move": move?.toJson(),
      };
}
