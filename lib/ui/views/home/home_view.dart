import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:pokeapp/models/simple_pokemon.dart';
import 'package:pokeapp/ui/common/ui_helpers.dart';
import 'package:pokeapp/ui/widgets/widgets.dart';
import 'package:pokeapp/utils/screen_helper.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    List<SimplePokemon> pokemons = viewModel.pokemons;
    List<SimplePokemon> filteredPokemons = viewModel.filteredPokemons;

    final ScreenHelper display = ScreenHelper();

    return Scaffold(
      drawer: display.isMobile(context) || display.isTablet(context)
          ? CustomDrawer(
              filters: viewModel.filters,
              onChanged: viewModel.onFilterChanged,
              onClearFilters: viewModel.clearFilters,
              onApplyFilters: viewModel.getFilteredPokemons,
              filterCount: viewModel.getTotalFilters(),
            )
          : null,
      onDrawerChanged: viewModel.onDrawerChanged,
      appBar: CustomAppbar(viewModel: viewModel),
      body: Row(
        children: [
          display.isMobile(context) || display.isTablet(context)
              ? const SizedBox()
              : Expanded(
                  flex: 2,
                  child: FadeInLeft(
                    duration: animationDuration,
                    child: CustomDrawer(
                      backgroundColor: Colors.grey.shade200,
                      filters: viewModel.filters,
                      onChanged: viewModel.onFilterChanged,
                      onClearFilters: viewModel.clearFilters,
                      onApplyFilters: viewModel.getFilteredPokemons,
                      filterCount: viewModel.getTotalFilters(),
                    ),
                  ),
                ),
          Expanded(
            flex: 5,
            child: viewModel.apiResponse == null || viewModel.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : FadeInUp(
                    duration: animationDuration,
                    child: Stack(
                      children: [
                        if (pokemons.isNotEmpty && filteredPokemons.isEmpty)
                          GridViewBuilder(
                            crossAxisCount: display.getCrossAxisCount(context),
                            pokemons: pokemons,
                            onCardPressed: viewModel.navigateToPokemonDetail,
                            isPaginated:
                                viewModel.searchController.text.isEmpty,
                            onPaginated: viewModel.getPokemons,
                          ),
                        if (filteredPokemons.isNotEmpty)
                          GridViewBuilder(
                            crossAxisCount: display.getCrossAxisCount(context),
                            pokemons: filteredPokemons,
                            onCardPressed: viewModel.navigateToPokemonDetail,
                          ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
