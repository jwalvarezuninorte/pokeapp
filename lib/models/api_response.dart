import 'package:pokeapp/models/simple_pokemon.dart';

class ApiResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<SimplePokemon>? results;

  ApiResponse({required this.count, this.next, this.previous, this.results});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: (json['results'] as List)
          .map((e) => SimplePokemon.fromJson(e))
          .toList(),
    );
  }
}
