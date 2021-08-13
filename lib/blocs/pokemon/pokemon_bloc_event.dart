import 'package:pokedex/models/pokemon.dart';

abstract class PokemonBlocEvent {
  const PokemonBlocEvent();
}

class PokemonRetrieved extends PokemonBlocEvent {
  final Pokemon pokemon;

  const PokemonRetrieved(this.pokemon);
}
