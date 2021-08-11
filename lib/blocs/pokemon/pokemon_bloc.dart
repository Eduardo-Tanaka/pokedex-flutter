import 'package:bloc/bloc.dart';
import 'package:pokedex/blocs/pokemon/pokemon_bloc_event.dart';
import 'package:pokedex/blocs/pokemon/pokemon_bloc_state.dart';
import 'package:pokedex/repositories/pokemon_repository.dart';

class PokemonBloc extends Bloc<PokemonBlocEvent, PokemonBlocState> {
  final PokemonRepository pokemonRepository;

  PokemonBloc(this.pokemonRepository) : super(PokemonLoadInProgress());

  @override
  Stream<PokemonBlocState> mapEventToState(PokemonBlocEvent event) async* {
    if (event is PokemonRetrieved) {
      try {
        final pokemon = await pokemonRepository.getPokemonById(event.id);

        yield PokemonLoadSucess(pokemon);
      } catch (_) {
        yield PokemonLoadFailure();
      }
    }
  }
}
