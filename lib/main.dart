import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/client/client.dart';
import 'package:pokedex/pages/card_home_widget.dart';
import 'package:pokedex/repositories/pokemon_repository.dart';

import 'blocs/pokemon_generation/pokemon_generation_bloc.dart';
import 'blocs/pokemon_generation/pokemon_generation_bloc_event.dart';
import 'blocs/pokemon_generation/pokemon_generation_bloc_state.dart';

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
        /*BlocProvider<PokemonBloc>(
          create: (_) => PokemonBloc(_pokemonRepository),
        ),*/
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
                return CardHomeWidget(
                  url: snapshot.response.pokemonSpecies[index].url,
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
