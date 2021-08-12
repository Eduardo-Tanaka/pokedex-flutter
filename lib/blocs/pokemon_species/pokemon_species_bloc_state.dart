import 'package:pokedex/models/pokemon.dart';

abstract class PokemonSpeciesBlocState {
  const PokemonSpeciesBlocState();
}

class PokemonSpecieLoadInProgress extends PokemonSpeciesBlocState {}

class PokemonSpecieLoadSucess extends PokemonSpeciesBlocState {
  final Pokemon pokemon;

  const PokemonSpecieLoadSucess(this.pokemon);

  @override
  String toString() => 'PokemonSpecieLoadSucess { response: $pokemon }';
}

class PokemonSpecieLoadFailure extends PokemonSpeciesBlocState {}
