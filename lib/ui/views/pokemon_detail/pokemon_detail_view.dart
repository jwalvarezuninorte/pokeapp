import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:pokeapp/models/pokemon.dart';
import 'package:pokeapp/ui/common/ui_helpers.dart';
import 'package:pokeapp/ui/widgets/widgets.dart';
import 'package:pokeapp/utils/app_theme.dart';
import 'package:pokeapp/utils/screen_helper.dart';
import 'package:stacked/stacked.dart';

import 'pokemon_detail_viewmodel.dart';

class PokemonDetailView extends StackedView<PokemonDetailViewModel> {
  const PokemonDetailView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PokemonDetailViewModel viewModel,
    Widget? child,
  ) {
    final id = ModalRoute.of(context)?.settings.arguments as int;
    final display = ScreenHelper();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles del pokemon'),
        elevation: 0,
        centerTitle: false,
      ),
      body: FutureBuilder(
        future: viewModel.getPokemonById(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text('Error'),
            );
          }

          if (snapshot.hasData) {
            final pokemon = snapshot.data as Pokemon;

            final List<String> images = pokemon.sprites.getImages();

            final String? imageUrl =
                pokemon.sprites.other!.dreamWorld!.frontDefault;

            return GridView(
              shrinkWrap: true,
              clipBehavior: Clip.none,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: display.isMobile(context) ? 1 : 2,
                childAspectRatio: display.getChildAspectRatio(context),
                // crossAxisSpacing: AppTheme.padding,
                mainAxisSpacing: AppTheme.padding * 2,
              ),
              children: [
                SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  clipBehavior: Clip.none,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      verticalSpaceMedium,
                      FadeIn(
                        duration: animationDuration * 3,
                        child: PokemonMainImage(
                          imageUrl: imageUrl,
                          pokemonId: pokemon.id as int,
                        ),
                      ),
                      ImageCarousel(images: images),
                      verticalSpaceMedium,
                      PokemonBasicInfo(pokemon: pokemon),
                      PokemonGeneralInfo(pokemon: pokemon),
                      verticalSpaceMedium,
                    ],
                  ),
                ),
                FadeInRight(
                  duration: animationDuration,
                  child: PokemonStats(stats: pokemon.stats),
                ),
              ],
            );
          }

          return const Center(
            child: Text('No data'),
          );
        },
      ),
    );
  }

  @override
  PokemonDetailViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PokemonDetailViewModel();
}
