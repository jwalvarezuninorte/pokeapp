import 'package:pokeapp/utils/constants.dart';

class SimplePokemon {
  final int id;
  final String name;
  final String imgUrl;

  SimplePokemon({required this.name, required this.imgUrl, required this.id});

  factory SimplePokemon.fromJson(Map<String, dynamic> json) {
    return SimplePokemon(
      id: int.parse(json['url'].split('/').reversed.toList()[1]),
      name: json['name'],
      imgUrl: '${baseImgUrl + json['url'].split('/').reversed.toList()[1]}.svg',
    );
  }
}
