import 'package:flutter/material.dart';
import 'package:pokeapp/models/pokemon.dart';
import 'package:pokeapp/ui/common/ui_helpers.dart';
import 'package:pokeapp/utils/app_theme.dart';

class PokemonBasicInfo extends StatelessWidget {
  const PokemonBasicInfo({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.padding,
      ),
      child: Column(
        children: [
          Text(
            pokemon.name,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          verticalSpaceSmall,
          SizedBox(
            height: 40,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Chip(
                label: Text(pokemon.types[index].type.name),
              ),
              separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
              itemCount: pokemon.types.length,
            ),
          ),
        ],
      ),
    );
  }
}
