import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/blocs/pokemon/pokemon_bloc.dart';
import 'package:pokedex/blocs/pokemon/pokemon_bloc_state.dart';

import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/extensions/string_extension.dart';

class Evolution extends StatelessWidget {
  final Pokemon pokemon;

  const Evolution({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(pokemon.evolutionChain.chain);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Evolution",
          style: TextStyle(
            color: pokemon.pokemonSpecies.color.name.getColor(),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        BlocBuilder<PokemonBloc, PokemonBlocState>(
          builder: (context, state) {
            // TODO refactor evolution chain logic, (2nd generation and ahead)
            return Column(
              children: [
                pokemon.evolutionChain.chain.evolvesTo.isNotEmpty &&
                        state.pokemons.containsKey(int.parse(pokemon
                            .evolutionChain.chain.species.url
                            .split('pokemon-species')[1]
                            .replaceAll(RegExp(r'[^0-9]'), '')))
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CachedNetworkImage(
                            placeholder: (context, url) =>
                                Center(child: CircularProgressIndicator()),
                            imageUrl: state
                                .pokemons[int.parse(pokemon
                                    .evolutionChain.chain.species.url
                                    .split('pokemon-species')[1]
                                    .replaceAll(RegExp(r'[^0-9]'), ''))]!
                                .pokemon
                                .sprites
                                .other
                                .officialArtwork
                                .frontDefault,
                            width: 120,
                            height: 120,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "Level ${pokemon.evolutionChain.chain.evolvesTo.first.evolutionDetails.first.minLevel}",
                                  style: TextStyle(
                                    color: pokemon.pokemonSpecies.color.name
                                        .getColor(),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Divider(
                                    thickness: 4,
                                  ),
                                )
                              ],
                            ),
                          ),
                          CachedNetworkImage(
                            placeholder: (context, url) =>
                                Center(child: CircularProgressIndicator()),
                            imageUrl: state
                                    .pokemons[int.parse(pokemon.evolutionChain
                                        .chain.evolvesTo.first.species.url
                                        .split('pokemon-species')[1]
                                        .replaceAll(RegExp(r'[^0-9]'), ''))]
                                    ?.pokemon
                                    .sprites
                                    .other
                                    .officialArtwork
                                    .frontDefault ??
                                '',
                            width: 120,
                            height: 120,
                          ),
                        ],
                      )
                    : CachedNetworkImage(
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        imageUrl: pokemon
                            .pokemon.sprites.other.officialArtwork.frontDefault,
                        width: 120,
                        height: 120,
                      ),
                SizedBox(
                  height: 8,
                ),
                pokemon.evolutionChain.chain.evolvesTo.isNotEmpty &&
                        pokemon.evolutionChain.chain.evolvesTo.first.evolvesTo
                            .isNotEmpty
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CachedNetworkImage(
                            placeholder: (context, url) =>
                                Center(child: CircularProgressIndicator()),
                            imageUrl: state
                                    .pokemons[int.parse(pokemon.evolutionChain
                                        .chain.evolvesTo.first.species.url
                                        .split('pokemon-species')[1]
                                        .replaceAll(RegExp(r'[^0-9]'), ''))]
                                    ?.pokemon
                                    .sprites
                                    .other
                                    .officialArtwork
                                    .frontDefault ??
                                '',
                            width: 120,
                            height: 120,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "Level ${pokemon.evolutionChain.chain.evolvesTo.first.evolvesTo.first.evolutionDetails.first.minLevel}",
                                  style: TextStyle(
                                    color: pokemon.pokemonSpecies.color.name
                                        .getColor(),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Divider(
                                    thickness: 4,
                                  ),
                                )
                              ],
                            ),
                          ),
                          CachedNetworkImage(
                            placeholder: (context, url) =>
                                Center(child: CircularProgressIndicator()),
                            imageUrl: state
                                    .pokemons[int.parse(pokemon
                                        .evolutionChain
                                        .chain
                                        .evolvesTo
                                        .first
                                        .evolvesTo
                                        .first
                                        .species
                                        .url
                                        .split('pokemon-species')[1]
                                        .replaceAll(RegExp(r'[^0-9]'), ''))]
                                    ?.pokemon
                                    .sprites
                                    .other
                                    .officialArtwork
                                    .frontDefault ??
                                '',
                            width: 120,
                            height: 120,
                          ),
                        ],
                      )
                    : Container(),
              ],
            );
          },
        ),
      ],
    );
  }
}
