import 'package:pokeapp/app/app.locator.dart';
import 'package:pokeapp/models/pokemon.dart';
import 'package:pokeapp/services/pokemon_service.dart';
import 'package:stacked/stacked.dart';

class PokemonDetailViewModel extends BaseViewModel {
  final _pokemonService = locator<PokemonService>();

  late Pokemon _pokemon;

  get pokemon => _pokemon;

  Future<Pokemon> getPokemonById(int id) async {
    _pokemon = await _pokemonService.getPokemonDetail(id);
    return _pokemon;
  }
}
