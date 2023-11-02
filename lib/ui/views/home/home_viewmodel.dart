import 'package:flutter/material.dart';
import 'package:pokeapp/app/app.locator.dart';
import 'package:pokeapp/app/app.router.dart';
import 'package:pokeapp/models/api_response.dart';
import 'package:pokeapp/models/common_type.dart';
import 'package:pokeapp/models/simple_pokemon.dart';
import 'package:pokeapp/services/pokemon_service.dart';
import 'package:pokeapp/utils/constants.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _pokemonService = locator<PokemonService>();
  final _navigationService = locator<NavigationService>();

  HomeViewModel() {
    getPokemons();
    getAllFilters();
  }

  GlobalKey<FormFieldState> searchKey = GlobalKey();
  TextEditingController searchController = TextEditingController();
  bool isLoading = false;

  ApiResponse? _apiResponse;
  final List<SimplePokemon> _pokemons = [];
  List<SimplePokemon> _allPokemons = [];
  List<CommonType> _filters = [];

  final List<SimplePokemon> _filteredPokemons = [];

  ApiResponse? get apiResponse => _apiResponse;

  get pokemons => _pokemons;

  List<CommonType> get filters => _filters;

  List<SimplePokemon> get filteredPokemons => _filteredPokemons;

  set apiResponse(ApiResponse? value) {
    _apiResponse = value;
    rebuildUi();
  }

  set filters(List<CommonType> value) {
    _filters = value;
    rebuildUi();
  }

  // Obtaining Pokemon data from the API, keeping paging in mind
  Future<List<SimplePokemon>> getPokemons() async {
    final url = _apiResponse?.next ?? "$baseUrl/pokemon";
    _apiResponse = await _pokemonService.getPokemons(url);
    _pokemons.addAll(_apiResponse?.results ?? []);

    rebuildUi();
    return _pokemons;
  }

  // Fetch filtered Pokemon data based on selected filters
  Future getFilteredPokemons() async {
    _filteredPokemons.clear();
    clearSearch();

    for (var filter in _filters) {
      if (filter.isSelected) {
        final pokemons = await _pokemonService.getPokemonsByType(filter.url);
        _filteredPokemons.addAll(pokemons);
      }
    }

    rebuildUi();
  }

  // Search for Pokemon based on a query.
  // Note that the API does not support searching by name, so we have to get
  // all Pokemon data and filter it ourselves.
  void searchPokemon() async {
    isLoading = true;
    rebuildUi();

    _filteredPokemons.clear();
    clearFilters();

    final String query = searchController.text.trim();

    // we get all pokemons to filter them based on the query
    final response = await _pokemonService.getPokemons(
      "$baseUrl/pokemon",
      limit: _apiResponse?.count ?? 1,
    );

    _allPokemons = response.results ?? [];

    _pokemons.clear();
    _pokemons.addAll(
      _allPokemons.where((element) => element.name.contains(query)),
    );

    isLoading = false;
    rebuildUi();
  }

  // Fetch all Pokemon types, so we can show them in the drawer
  void getAllFilters() async {
    if (_filters.isNotEmpty) return;

    _filters = await _pokemonService.getAllFilters();
    rebuildUi();
  }

  void onFilterChanged(bool? value, CommonType filter) {
    _filters = _filters.map((e) {
      if (e.name == filter.name) {
        e.isSelected = value ?? false;
      }
      return e;
    }).toList();

    // verify if we have any filter selected
    final total = getTotalFilters();

    if (total == 0) {
      clearFilters();
      return;
    }
    rebuildUi();
  }

  void clearFilters() {
    _filters = _filters.map((e) {
      e.isSelected = false;
      return e;
    }).toList();

    if (_filteredPokemons.isEmpty) return rebuildUi();

    _filteredPokemons.clear();
    clearSearch();
    // rebuildUi();
  }

  void clearSearch() {
    searchController.clear();
    _pokemons.clear();
    apiResponse = null;

    getPokemons();
  }

  int getTotalFilters() {
    final total = filters.where((element) => element.isSelected).length;
    return total;
  }

  void navigateToPokemonDetail(int id) {
    _navigationService.navigateTo(
      Routes.pokemonDetailView,
      arguments: id,
    );
  }

  void onDrawerChanged(bool value) async {
    if (value) return;

    if (getTotalFilters() == 0) return;

    await getFilteredPokemons();
  }
}
