import 'package:bloc/bloc.dart';
import 'package:pokedex/blocs/pokemon_bloc_event.dart';
import 'package:pokedex/blocs/pokemon_bloc_state.dart';
import 'package:pokedex/repositories/pokemon_repository.dart';

class PokemonBloc extends Bloc<PokemonBlocEvent, PokemonBlocState> {
  final PokemonRepository pokemonRepository;

  PokemonBloc(this.pokemonRepository) : super(PokemonLoadInProgress());

  @override
  Stream<PokemonBlocState> mapEventToState(PokemonBlocEvent event) async* {
    switch (event) {
      case PokemonBlocEvent.pokemonGenerationRetrieved:
        try {
          yield PokemonLoadSucess(
              await pokemonRepository.getAllPokemonsByGeneration(1));
        } catch (_) {
          yield PokemonLoadFailure();
        }

        break;
    }
  }
}
