import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokeapp/models/simple_pokemon.dart';
import 'package:pokeapp/ui/common/ui_helpers.dart';
import 'package:pokeapp/utils/app_theme.dart';

class PokeCard extends StatelessWidget {
  const PokeCard({
    super.key,
    required this.pokemon,
    required this.onPressed,
  });

  final SimplePokemon pokemon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppTheme.radius),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 12,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          margin: const EdgeInsets.all(AppTheme.padding / 2),
          padding: const EdgeInsets.all(AppTheme.padding / 2),
          // height: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(AppTheme.padding / 2),
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppTheme.radius),
                  color: Colors.grey[200],
                ),
                child: SvgPicture.network(
                  pokemon.imgUrl,
                  width: 120,
                ),
              ),
              horizontalSpaceMedium,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(pokemon.name, style: AppTheme.title),
                  verticalSpaceSmall,
                  TextButton(
                    onPressed: onPressed,
                    child: const Text('Ver detalles'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
