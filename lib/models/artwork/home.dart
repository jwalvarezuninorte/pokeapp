import 'package:pokeapp/models/artwork/artwork.dart';

class Home extends Artwork {
  final String? frontShiny;
  final dynamic frontShinyFemale;

  Home({
    frontDefault,
    frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  }) : super(frontDefault: frontDefault, frontFemale: frontFemale);

  factory Home.fromJson(Map<String, dynamic> json) => Home(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
      };
}
