import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/client/client.dart';
import 'package:pokedex/pages/home_page.dart';
import 'package:pokedex/repositories/pokemon_repository.dart';

import 'blocs/pokemon/pokemon_bloc.dart';
import 'blocs/pokemon_generation/pokemon_generation_bloc.dart';

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
        BlocProvider<PokemonBloc>(
          create: (_) => PokemonBloc(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
