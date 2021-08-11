import 'package:pokedex/models/pokemon_generation_response.dart';

abstract class PokemonGenerationBlocState {
  const PokemonGenerationBlocState();
}

class PokemonGenerationLoadInProgress extends PokemonGenerationBlocState {}

class PokemonGenerationLoadSucess extends PokemonGenerationBlocState {
  final PokemonGenerationResponse response;

  const PokemonGenerationLoadSucess(this.response);

  @override
  String toString() => 'PokemonGenerationLoadSucess { response: $response }';
}

class PokemonGenerationLoadFailure extends PokemonGenerationBlocState {}
