import 'package:pokedex/models/pokemon_generation_response.dart';

abstract class PokemonBlocState {
  const PokemonBlocState();
}

class PokemonLoadInProgress extends PokemonBlocState {}

class PokemonLoadSucess extends PokemonBlocState {
  final PokemonGenerationResponse response;

  const PokemonLoadSucess(this.response);

  @override
  String toString() => 'PokemonLoadSuccess { response: $response }';
}

class PokemonLoadFailure extends PokemonBlocState {}
