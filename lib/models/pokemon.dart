import 'dart:convert';

import 'package:pokeapp/models/ability.dart';
import 'package:pokeapp/models/common_type.dart';
import 'package:pokeapp/models/sprites.dart';
import 'package:pokeapp/models/stat.dart';
import 'package:pokeapp/models/type.dart';

Pokemon pokemonFromJson(String str) => Pokemon.fromJson(json.decode(str));

class Pokemon {
  final int? id;
  final String name;
  final Sprites sprites;
  final int? height;
  final int? weight;
  final List<Ability>? abilities;
  final int? baseExperience;
  final CommonType? species;
  final List<Stat> stats;
  final List<Type> types;

  Pokemon({
    this.id,
    required this.name,
    required this.sprites,
    this.height,
    this.weight,
    this.abilities,
    this.baseExperience,
    this.species,
    required this.stats,
    required this.types,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        id: json["id"],
        name: json["name"],
        sprites: Sprites.fromJson(json["sprites"]),
        height: json["height"],
        weight: json["weight"],
        abilities: json["abilities"] == null
            ? []
            : List<Ability>.from(
                json["abilities"]!.map((x) => Ability.fromJson(x))),
        baseExperience: json["base_experience"],
        species: json["species"] == null
            ? null
            : CommonType.fromJson(json["species"]),
        stats: json["stats"] == null
            ? []
            : List<Stat>.from(json["stats"]!.map((x) => Stat.fromJson(x))),
        types: json["types"] == null
            ? []
            : List<Type>.from(json["types"]!.map((x) => Type.fromJson(x))),
      );
}
