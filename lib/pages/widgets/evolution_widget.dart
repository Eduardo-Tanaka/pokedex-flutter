import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:pokedex/models/pokemon.dart';

class Evolution extends StatelessWidget {
  final Pokemon pokemon;

  const Evolution({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Evolution",
        ),
        SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CachedNetworkImage(
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              imageUrl:
                  pokemon.pokemon.sprites.other.officialArtwork.frontDefault,
              width: 120,
              height: 120,
            ),
            Expanded(
              child: Column(
                children: [
                  Text("Level 16"),
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
              imageUrl:
                  pokemon.pokemon.sprites.other.officialArtwork.frontDefault,
              width: 120,
              height: 120,
            ),
          ],
        ),
      ],
    );
  }
}
