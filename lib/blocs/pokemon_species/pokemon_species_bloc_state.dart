import 'package:pokedex/models/pokemon_species/pokemon_species_response.dart';

abstract class PokemonSpeciesBlocState {
  const PokemonSpeciesBlocState();
}

class PokemonSpecieLoadInProgress extends PokemonSpeciesBlocState {}

class PokemonSpecieLoadSucess extends PokemonSpeciesBlocState {
  final PokemonSpeciesResponse response;

  const PokemonSpecieLoadSucess(this.response);

  @override
  String toString() => 'PokemonSpecieLoadSucess { response: $response }';
}

class PokemonSpecieLoadFailure extends PokemonSpeciesBlocState {}
