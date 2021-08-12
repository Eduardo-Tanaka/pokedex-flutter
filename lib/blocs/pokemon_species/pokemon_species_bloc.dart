import 'package:bloc/bloc.dart';
import 'package:pokedex/blocs/pokemon_species/pokemon_species_bloc_event.dart';
import 'package:pokedex/blocs/pokemon_species/pokemon_species_bloc_state.dart';
import 'package:pokedex/repositories/pokemon_repository.dart';

class PokemonSpeciesBloc
    extends Bloc<PokemonSpeciesBlocEvent, PokemonSpeciesBlocState> {
  final PokemonRepository pokemonRepository;

  PokemonSpeciesBloc(this.pokemonRepository)
      : super(PokemonSpecieLoadInProgress());

  @override
  Stream<PokemonSpeciesBlocState> mapEventToState(
      PokemonSpeciesBlocEvent event) async* {
    if (event is PokemonSpecieRetrieved) {
      try {
        final pokemon = await pokemonRepository.getPokemonSpecieById(event.id);

        yield PokemonSpecieLoadSucess(pokemon);
      } catch (e) {
        yield PokemonSpecieLoadFailure();
      }
    }
  }
}
