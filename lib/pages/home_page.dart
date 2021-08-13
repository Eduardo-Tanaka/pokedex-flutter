import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/blocs/pokemon/pokemon_bloc.dart';
import 'package:pokedex/blocs/pokemon/pokemon_bloc_event.dart';
import 'package:pokedex/blocs/pokemon_generation/pokemon_generation_bloc.dart';
import 'package:pokedex/blocs/pokemon_generation/pokemon_generation_bloc_event.dart';
import 'package:pokedex/blocs/pokemon_generation/pokemon_generation_bloc_state.dart';
import 'package:pokedex/blocs/pokemon_species/pokemon_species_bloc.dart';
import 'package:pokedex/blocs/pokemon_species/pokemon_species_bloc_event.dart';
import 'package:pokedex/blocs/pokemon_species/pokemon_species_bloc_state.dart';
import 'package:pokedex/client/client.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/pages/widgets/card_home_placeholder_widget.dart';
import 'package:pokedex/pages/widgets/card_home_widget.dart';
import 'package:pokedex/pages/widgets/input_search_widget.dart';
import 'package:pokedex/repositories/pokemon_repository.dart';

import 'package:pokedex/extensions/string_extension.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<int, Pokemon> _pokemons = Map();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Text(
          'Pokédex',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: InputSearchWidget(
                        title: 'Search for a Pokémon',
                        prefixIcon: Icons.search_outlined,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      Icons.tune_outlined,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                child: Text(
                  "The pokédex contains detailed stats for every creature from the Pokémon games.",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 110),
            child:
                BlocBuilder<PokemonGenerationBloc, PokemonGenerationBlocState>(
              builder: (context, snapshot) {
                if (snapshot is PokemonGenerationLoadSucess) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.response.pokemonSpecies.length,
                    itemBuilder: (ctx, index) {
                      final int _id = int.parse(snapshot
                          .response.pokemonSpecies[index].url
                          .split('pokemon-species')[1]
                          .replaceAll(RegExp(r'[^0-9]'), ''));
                      final _dio = Client().init();
                      final _pokemonRepository = PokemonRepository(_dio);
                      return BlocProvider(
                        create: (context) =>
                            PokemonSpeciesBloc(_pokemonRepository),
                        child: BlocBuilder<PokemonSpeciesBloc,
                            PokemonSpeciesBlocState>(
                          builder: (ctx, state) {
                            if (state is PokemonSpecieLoadInProgress &&
                                !_pokemons.keys.contains(_id)) {
                              ctx
                                  .read<PokemonSpeciesBloc>()
                                  .add(PokemonSpecieRetrieved(_id));

                              return CardHomePlaceholderWidget();
                            } else if (state is PokemonSpecieLoadSucess) {
                              context
                                  .read<PokemonBloc>()
                                  .add(PokemonRetrieved(state.pokemon));
                              _pokemons[_id] = state.pokemon;
                              return CardHomeWidget(
                                url:
                                    snapshot.response.pokemonSpecies[index].url,
                                color: state.pokemon.pokemonSpecies.color.name
                                    .getColor(),
                                pokemon: state.pokemon,
                              );
                            } else if (_pokemons.keys.contains(_id)) {
                              return CardHomeWidget(
                                url:
                                    snapshot.response.pokemonSpecies[index].url,
                                color: _pokemons[_id]
                                    ?.pokemonSpecies
                                    .color
                                    .name
                                    .getColor(),
                                pokemon: _pokemons[_id]!,
                              );
                            } else {
                              print("111111111111111111111111111 $_id");
                              ctx
                                  .read<PokemonSpeciesBloc>()
                                  .add(PokemonSpecieRetrieved(_id));
                              return CardHomePlaceholderWidget();
                            }
                          },
                        ),
                      );
                    },
                  );
                } else if (snapshot is PokemonGenerationLoadInProgress) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(child: CircularProgressIndicator()),
                    ],
                  );
                }
                return Container();
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context
              .read<PokemonGenerationBloc>()
              .add(PokemonGenerationRetrieved(1));
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
