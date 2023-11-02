import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokeapp/utils/app_theme.dart';
import 'package:pokeapp/utils/screen_helper.dart';

class PokemonMainImage extends StatelessWidget {
  const PokemonMainImage({super.key, this.imageUrl});

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    final display = ScreenHelper();

    return Container(
      padding: const EdgeInsets.all(AppTheme.padding / 2),
      margin: const EdgeInsets.fromLTRB(
        AppTheme.padding,
        0,
        AppTheme.padding,
        AppTheme.padding,
      ),
      width: double.infinity,
      height: display.isMobile(context)
          ? (MediaQuery.of(context).size.width - AppTheme.padding * 2)
          : 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppTheme.radius),
        color: Colors.grey[200],
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.padding * 2),
        child: imageUrl == null
            ? Image.asset(
                'assets/images/pokeball.png',
                width: 120,
                height: 120,
              )
            : SvgPicture.network(imageUrl as String),
      ),
    );
  }
}
