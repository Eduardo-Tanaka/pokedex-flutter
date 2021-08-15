import 'package:bloc/bloc.dart';
import 'package:pokedex/blocs/pokemon/pokemon_bloc_event.dart';
import 'package:pokedex/blocs/pokemon/pokemon_bloc_state.dart';

class PokemonBloc extends Bloc<PokemonBlocEvent, PokemonBlocState> {
  PokemonBloc() : super(PokemonBlocState(pokemons: Map()));

  @override
  Stream<PokemonBlocState> mapEventToState(PokemonBlocEvent event) async* {
    if (event is PokemonRetrieved) {
      state.pokemons[event.pokemon.id] = event.pokemon;

      yield PokemonBlocState(pokemons: state.pokemons);
    }
  }
}
