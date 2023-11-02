import 'package:flutter/material.dart';
import 'package:pokeapp/models/simple_pokemon.dart';
import 'package:pokeapp/ui/widgets/pokemon_card.dart';
import 'package:pokeapp/utils/app_theme.dart';

class GridViewBuilder extends StatelessWidget {
  const GridViewBuilder({
    super.key,
    required this.crossAxisCount,
    required this.pokemons,
    required this.onCardPressed,
    this.isPaginated = false,
    this.onPaginated,
  });

  final int crossAxisCount;
  final List<SimplePokemon> pokemons;
  final void Function(int id) onCardPressed;

  final bool? isPaginated;
  final VoidCallback? onPaginated;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(AppTheme.padding / 2),
      itemCount: pokemons.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: 3,
        crossAxisSpacing: AppTheme.padding / 2,
      ),
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        if (isPaginated == true && index == pokemons.length - 1) {
          onPaginated!();
        }

        return PokeCard(
          pokemon: pokemons[index],
          onPressed: () => onCardPressed(pokemons[index].id),
        );
      },
    );
  }
}
