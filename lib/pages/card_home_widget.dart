import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:pokedex/blocs/pokemon/pokemon_bloc.dart';
import 'package:pokedex/blocs/pokemon/pokemon_bloc_event.dart';
import 'package:pokedex/blocs/pokemon/pokemon_bloc_state.dart';
import 'package:pokedex/client/client.dart';
import 'package:pokedex/models/pokemon/pokemon_response.dart';
import 'package:pokedex/pages/card_home_placeholder_widget.dart';
import 'package:pokedex/pages/pokedex_icon_widget.dart';
import 'package:pokedex/repositories/pokemon_repository.dart';
import 'package:pokedex/extensions/string_extension.dart';

class CardHomeWidget extends StatelessWidget {
  final String url;
  final Color? color;
  final Map<int, PokemonResponse> pokemons;

  const CardHomeWidget({
    Key? key,
    required this.url,
    this.color,
    required this.pokemons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int _id = int.parse(
        url.split('pokemon-species')[1].replaceAll(RegExp(r'[^0-9]'), ''));
    final _dio = Client().init();
    final _pokemonRepository = PokemonRepository(_dio);
    return BlocProvider(
      create: (context) => PokemonBloc(_pokemonRepository),
      child: BlocBuilder<PokemonBloc, PokemonBlocState>(
        builder: (ctx, state) {
          if (state is PokemonLoadInProgress && !pokemons.keys.contains(_id)) {
            ctx.read<PokemonBloc>().add(PokemonRetrieved(_id));
            return CardHomePlaceholderWidget();
          } else if (state is PokemonLoadSucess ||
              pokemons.keys.contains(_id)) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: color,
                  border: Border.all(color: color ?? Colors.black, width: 0.0),
                  borderRadius: BorderRadius.all(Radius.elliptical(16, 16)),
                ),
                height: 100,
                child: Row(
                  children: [
                    CachedNetworkImage(
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      imageUrl: pokemons[_id] == null
                          ? (state as PokemonLoadSucess)
                              .response
                              .sprites
                              .other
                              .officialArtwork
                              .frontDefault
                          : pokemons[_id]!
                              .sprites
                              .other
                              .officialArtwork
                              .frontDefault,
                      width: 100,
                      height: 100,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8, left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              pokemons[_id] == null
                                  ? (state as PokemonLoadSucess)
                                      .response
                                      .name
                                      .capitalize()
                                  : pokemons[_id]!.name.capitalize(),
                              style: TextStyle(
                                color: color == Colors.white
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: pokemons[_id] == null
                                        ? (state as PokemonLoadSucess)
                                            .response
                                            .types
                                            .length
                                        : pokemons[_id]!.types.length,
                                    itemBuilder: (context, index) {
                                      return PokedexIconWidget(
                                        type: pokemons[_id] == null
                                            ? (state as PokemonLoadSucess)
                                                .response
                                                .types[index]
                                                .type
                                            : pokemons[_id]!.types[index].type,
                                      );
                                    },
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                      NumberFormat("'#'000").format(_id),
                                      style: TextStyle(
                                        color: color == Colors.white
                                            ? Colors.black.withOpacity(0.4)
                                            : Colors.white.withOpacity(0.4),
                                        fontSize: 36,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return CardHomePlaceholderWidget();
          }
        },
      ),
    );
  }
}
