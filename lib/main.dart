import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/client/client.dart';
import 'package:pokedex/pages/widgets/card_home_placeholder_widget.dart';
import 'package:pokedex/pages/widgets/card_home_widget.dart';
import 'package:pokedex/repositories/pokemon_repository.dart';

import 'blocs/pokemon_generation/pokemon_generation_bloc.dart';
import 'blocs/pokemon_generation/pokemon_generation_bloc_event.dart';
import 'blocs/pokemon_generation/pokemon_generation_bloc_state.dart';
import 'blocs/pokemon_species/pokemon_species_bloc.dart';
import 'blocs/pokemon_species/pokemon_species_bloc_event.dart';
import 'blocs/pokemon_species/pokemon_species_bloc_state.dart';
import 'models/pokemon.dart';
import 'package:pokedex/extensions/string_extension.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _dio = Client().init();
    final _pokemonRepository = PokemonRepository(_dio);

    return MultiBlocProvider(
      providers: [
        BlocProvider<PokemonGenerationBloc>(
          create: (_) => PokemonGenerationBloc(_pokemonRepository),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final Map<int, Pokemon> _pokemons = Map();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<PokemonGenerationBloc, PokemonGenerationBlocState>(
        builder: (context, snapshot) {
          if (snapshot is PokemonGenerationLoadSucess) {
            return ListView.builder(
              itemCount: snapshot.response.pokemonSpecies.length,
              itemBuilder: (ctx, index) {
                final int _id = int.parse(snapshot
                    .response.pokemonSpecies[index].url
                    .split('pokemon-species')[1]
                    .replaceAll(RegExp(r'[^0-9]'), ''));
                final _dio = Client().init();
                final _pokemonRepository = PokemonRepository(_dio);
                return BlocProvider(
                  create: (context) => PokemonSpeciesBloc(_pokemonRepository),
                  child:
                      BlocBuilder<PokemonSpeciesBloc, PokemonSpeciesBlocState>(
                    builder: (ctx, state) {
                      if (state is PokemonSpecieLoadInProgress &&
                          !_pokemons.keys.contains(_id)) {
                        ctx
                            .read<PokemonSpeciesBloc>()
                            .add(PokemonSpecieRetrieved(_id));
                        return CardHomePlaceholderWidget();
                      } else if (state is PokemonSpecieLoadSucess) {
                        _pokemons[_id] = state.pokemon;
                        return CardHomeWidget(
                          url: snapshot.response.pokemonSpecies[index].url,
                          color: state.pokemon.pokemonSpecies.color.name
                              .getColor(),
                          pokemon: state.pokemon,
                        );
                      } else if (_pokemons.keys.contains(_id)) {
                        return CardHomeWidget(
                          url: snapshot.response.pokemonSpecies[index].url,
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
            return CircularProgressIndicator();
          }
          return Container();
        },
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
