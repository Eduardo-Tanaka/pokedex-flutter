import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/blocs/pokemon_bloc.dart';
import 'package:pokedex/blocs/pokemon_bloc_event.dart';
import 'package:pokedex/blocs/pokemon_bloc_state.dart';
import 'package:pokedex/client/client.dart';
import 'package:pokedex/repositories/pokemon_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _dio = Client().init();
    return BlocProvider(
      create: (_) => PokemonBloc(PokemonRepository(_dio)),
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
      body: BlocBuilder<PokemonBloc, PokemonBlocState>(
        builder: (context, snapshot) {
          if (snapshot is PokemonLoadSucess) {
            return ListView.builder(
              itemCount: snapshot.response.pokemonSpecies.length,
              itemBuilder: (ctx, index) {
                return Text(snapshot.response.pokemonSpecies[index].name);
              },
            );
          } else if (snapshot is PokemonLoadInProgress) {
            return CircularProgressIndicator();
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context
              .read<PokemonBloc>()
              .add(PokemonBlocEvent.pokemonGenerationRetrieved);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
