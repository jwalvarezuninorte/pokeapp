import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokeapp/models/api_response.dart';
import 'package:pokeapp/models/common_type.dart';
import 'package:pokeapp/models/pokemon.dart';
import 'package:pokeapp/models/simple_pokemon.dart';
import 'package:pokeapp/utils/constants.dart';

class PokemonService {
  Future<ApiResponse> getPokemons(String url, {int? limit = 20}) async {
    final String queryParams = Uri(queryParameters: {
      "limit": limit.toString(),
    }).query;

    final response = await http.get(Uri.parse('$url?$queryParams'));

    if (response.statusCode == 200) {
      return ApiResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load pokemons');
    }
  }

  Future<Pokemon> getPokemonDetail(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/pokemon/$id'));

    if (response.statusCode == 200) {
      return Pokemon.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load pokemon detail');
    }
  }

  Future<List<CommonType>> getAllFilters() async {
    final response = await http.get(Uri.parse('$baseUrl/type'));

    if (response.statusCode == 200) {
      return List.from(jsonDecode(response.body)['results'])
          .map((e) => CommonType.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load filters');
    }
  }

  Future<List<SimplePokemon>> getPokemonsByType(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return List.from(jsonDecode(response.body)['pokemon'])
          .map((e) => SimplePokemon.fromJson(e['pokemon']))
          .toList();
    } else {
      throw Exception('Failed to load pokemons by type');
    }
  }
}
