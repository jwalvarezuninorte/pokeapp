import 'package:pokeapp/models/artwork/artwork.dart';

class OfficialArtwork extends Artwork {
  final String? frontShiny;

  OfficialArtwork({
    frontDefault,
    this.frontShiny,
  }) : super(frontDefault: frontDefault);

  // Additional constructor if needed
  OfficialArtwork.withShiny({
    frontDefault,
    this.frontShiny,
  }) : super(frontDefault: frontDefault);

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) =>
      OfficialArtwork(
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
      );

  // Additional factory constructor if needed
  factory OfficialArtwork.fromJsonWithShiny(Map<String, dynamic> json) =>
      OfficialArtwork.withShiny(
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_shiny": frontShiny,
      };
}
