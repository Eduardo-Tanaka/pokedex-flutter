import 'package:pokedex/models/pokemon_generation_response.dart';

abstract class PokemonGenerationBlocState {
  const PokemonGenerationBlocState();
}

class PokemonGenerationLoadInProgress extends PokemonGenerationBlocState {}

class PokemonGenerationLoadSucess extends PokemonGenerationBlocState {
  final PokemonGenerationResponse response;
  final PokemonGenerationResponse filtered;

  const PokemonGenerationLoadSucess(this.response, this.filtered);

  @override
  String toString() => 'PokemonGenerationLoadSucess { response: $response }';
}

class PokemonGenerationLoadFailure extends PokemonGenerationBlocState {}
