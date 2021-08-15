import 'dart:async';

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
import 'package:pokedex/models/pokemon_generation_response.dart';
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
    final _controller = TextEditingController();
    Timer? _debounce;

    _controller.addListener(() {
      if (_debounce?.isActive ?? false) _debounce?.cancel();
      _debounce = Timer(const Duration(milliseconds: 300), () {
        PokemonGenerationLoadSucess p = context
            .read<PokemonGenerationBloc>()
            .state as PokemonGenerationLoadSucess;

        final e = PokemonGenerationResponse(
            pokemonSpecies: (p.response.pokemonSpecies
                .where((element) => element.name.startsWith(_controller.text))
                .toList()));

        context
            .read<PokemonGenerationBloc>()
            .add(PokemonGenerationFiltered(p.response, e));
      });
    });

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
                        controller: _controller,
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
                  print(snapshot.filtered);
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.filtered.pokemonSpecies.length,
                    itemBuilder: (ctx, index) {
                      final int _id = int.parse(snapshot
                          .filtered.pokemonSpecies[index].url
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
                            } else if (state is PokemonSpecieLoadSucess &&
                                !_pokemons.keys.contains(state.pokemon.id)) {
                              context
                                  .read<PokemonBloc>()
                                  .add(PokemonRetrieved(state.pokemon));
                              _pokemons[state.pokemon.id] = state.pokemon;
                              return CardHomeWidget(
                                color: state.pokemon.pokemonSpecies.color.name
                                    .getColor(),
                                pokemon: _pokemons[_id]!,
                              );
                            } else if (_pokemons.keys.contains(_id)) {
                              return CardHomeWidget(
                                color: _pokemons[_id]
                                    ?.pokemonSpecies
                                    .color
                                    .name
                                    .getColor(),
                                pokemon: _pokemons[_id]!,
                              );
                            } else {
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
