import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pokedex/blocs/pokemon/pokemon_bloc.dart';
import 'package:pokedex/blocs/pokemon/pokemon_bloc_event.dart';
import 'package:pokedex/blocs/pokemon/pokemon_bloc_state.dart';
import 'package:pokedex/client/client.dart';
import 'package:pokedex/repositories/pokemon_repository.dart';

import 'package:pokedex/extensions/string_extension.dart';

class CardHomeWidget extends StatelessWidget {
  final String url;

  const CardHomeWidget({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int _id = int.parse(
        url.split('pokemon-species')[1].replaceAll(RegExp(r'[^0-9]'), ''));
    return BlocProvider(
      create: (context) => PokemonBloc(PokemonRepository(Client().init())),
      child: BlocBuilder<PokemonBloc, PokemonBlocState>(
        builder: (ctx, state) {
          if (state is PokemonLoadSucess) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  border: Border.all(color: Colors.black, width: 0.0),
                  borderRadius: BorderRadius.all(Radius.elliptical(16, 16)),
                ),
                height: 100,
                child: Row(
                  children: [
                    CachedNetworkImage(
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      imageUrl: state
                          .response.sprites.other.officialArtwork.frontDefault,
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
                              state.response.name.capitalize(),
                              style: TextStyle(
                                color: Colors.white,
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
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 4,
                                      right: 8,
                                    ),
                                    child: Icon(
                                      Icons.ac_unit,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                      NumberFormat("'#'000").format(_id),
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.4),
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
          } else if (state is PokemonLoadInProgress) {
            ctx.read<PokemonBloc>().add(PokemonRetrieved(_id));
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  border: Border.all(color: Colors.black, width: 0.0),
                  borderRadius: BorderRadius.all(Radius.elliptical(16, 16)),
                ),
                height: 100,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  border: Border.all(color: Colors.black, width: 0.0),
                  borderRadius: BorderRadius.all(Radius.elliptical(16, 16)),
                ),
                height: 100,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
