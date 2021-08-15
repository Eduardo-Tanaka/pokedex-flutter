import 'package:bloc/bloc.dart';
import 'package:pokedex/blocs/pokemon_species/pokemon_species_bloc_event.dart';
import 'package:pokedex/blocs/pokemon_species/pokemon_species_bloc_state.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/models/type/type_response.dart';
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
        final pokemonSpecie =
            await pokemonRepository.getPokemonSpecieById(event.id);

        final pokemon = await pokemonRepository.getPokemonById(event.id);
        final int _id = int.parse(pokemonSpecie.evolutionChain.url
            .split('evolution-chain')[1]
            .replaceAll(RegExp(r'[^0-9]'), ''));
        final evolutionChain =
            await pokemonRepository.getEvolutionChainById(_id);

        List<TypeResponse> types = [];
        pokemon.types.forEach((element) async {
          final type = await pokemonRepository.getTypeById(
            int.parse(element.type.url
                .split('type')[1]
                .replaceAll(RegExp(r'[^0-9]'), '')),
          );
          types.add(type);
        });

        final poke = Pokemon(
          id: event.id,
          pokemon: pokemon,
          pokemonSpecies: pokemonSpecie,
          evolutionChain: evolutionChain,
          types: types,
        );

        yield PokemonSpecieLoadSucess(poke);
      } catch (e) {
        yield PokemonSpecieLoadFailure();
      }
    }
  }
}
