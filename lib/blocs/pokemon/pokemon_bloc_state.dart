import 'package:pokedex/models/pokemon/pokemon_response.dart';

abstract class PokemonBlocState {
  const PokemonBlocState();
}

class PokemonLoadInProgress extends PokemonBlocState {}

class PokemonLoadSucess extends PokemonBlocState {
  final PokemonResponse response;

  const PokemonLoadSucess(this.response);

  @override
  String toString() => 'PokemonLoadSucess { response: $response }';
}

class PokemonLoadFailure extends PokemonBlocState {}
