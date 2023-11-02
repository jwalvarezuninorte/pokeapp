import 'package:flutter/material.dart';
import 'package:pokeapp/models/stat.dart';
import 'package:pokeapp/ui/common/ui_helpers.dart';
import 'package:pokeapp/utils/app_theme.dart';

class PokemonStats extends StatelessWidget {
  const PokemonStats({super.key, required this.stats});

  final List<Stat> stats;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.padding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          verticalSpaceMedium,
          const Text(
            'Estadísticas',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          verticalSpaceSmall,
          ...List.generate(
            stats.length,
            (index) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(stats[index].stat.name),
                verticalSpaceTiny,
                LinearProgressIndicator(
                  value: stats[index].baseStat / 100,
                  minHeight: 12,
                  backgroundColor: AppTheme.primary.withOpacity(0.2),
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    AppTheme.primary,
                  ),
                ),
                verticalSpaceSmall,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
