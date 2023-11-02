import 'package:pokeapp/models/artwork/artwork.dart';

class DreamWorld extends Artwork {
  DreamWorld({
    frontDefault,
    frontFemale,
  }) : super(frontDefault: frontDefault, frontFemale: frontFemale);

  factory DreamWorld.fromJson(Map<String, dynamic> json) => DreamWorld(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
      );
}
