import 'package:flutter/material.dart';
import 'package:pokeapp/models/pokemon.dart';
import 'package:pokeapp/ui/common/ui_helpers.dart';
import 'package:pokeapp/utils/app_theme.dart';

class PokemonGeneralInfo extends StatelessWidget {
  const PokemonGeneralInfo({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppTheme.padding),
      margin: const EdgeInsets.all(AppTheme.padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppTheme.radius),
        color: Colors.grey[200],
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              const Text(
                'Peso:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              verticalSpaceSmall,
              Text(
                "${pokemon.weight} lbs",
                style: AppTheme.titleLarge.copyWith(
                  color: AppTheme.primary,
                ),
              ),
            ],
          ),
          Column(
            children: [
              const Text(
                'Altura:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              verticalSpaceSmall,
              Text(
                "${pokemon.height} inches",
                style: AppTheme.titleLarge.copyWith(
                  color: AppTheme.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
