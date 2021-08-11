import 'package:bloc/bloc.dart';
import 'package:pokedex/blocs/pokemon_generation/pokemon_generation_bloc_event.dart';
import 'package:pokedex/blocs/pokemon_generation/pokemon_generation_bloc_state.dart';
import 'package:pokedex/repositories/pokemon_repository.dart';

class PokemonGenerationBloc
    extends Bloc<PokemonGenerationBlocEvent, PokemonGenerationBlocState> {
  final PokemonRepository pokemonRepository;

  PokemonGenerationBloc(this.pokemonRepository)
      : super(PokemonGenerationLoadInProgress());

  @override
  Stream<PokemonGenerationBlocState> mapEventToState(
      PokemonGenerationBlocEvent event) async* {
    if (event is PokemonGenerationRetrieved) {
      try {
        final pokemons = await pokemonRepository
            .getAllPokemonsByGeneration(event.generation);
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

        yield PokemonGenerationLoadSucess(pokemons);
      } catch (_) {
        yield PokemonGenerationLoadFailure();
      }
    }
  }
}
