import 'package:pokedex/models/pokemon.dart';

class PokemonBlocState {
  final Map<int, Pokemon> pokemons;
  PokemonBlocState({
    required this.pokemons,
  });
}
