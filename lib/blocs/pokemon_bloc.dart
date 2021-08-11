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
          final pokemons =
              await pokemonRepository.getAllPokemonsByGeneration(1);
          // order pokemon list from id
          pokemons.pokemonSpecies.sort(
            (a, b) => int.parse(
              a.url.replaceAll(RegExp(r'[^0-9]'), ''),
            ).compareTo(
              int.parse(
                b.url.replaceAll(RegExp(r'[^0-9]'), ''),
              ),
            ),
          );
          yield PokemonLoadSucess(pokemons);
        } catch (_) {
          yield PokemonLoadFailure();
        }

        break;
    }
  }
}
