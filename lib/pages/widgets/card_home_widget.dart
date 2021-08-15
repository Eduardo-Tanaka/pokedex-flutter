import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/custom_page_route.dart';
import 'package:pokedex/pages/widgets/pokedex_icon_widget.dart';
import 'package:pokedex/extensions/string_extension.dart';

import '../detail_page.dart';

class CardHomeWidget extends StatelessWidget {
  final Color? color;
  final Pokemon pokemon;

  const CardHomeWidget({
    Key? key,
    this.color,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CustomPageRoute(DetailPage(pokemon: pokemon)),
        );
      },
      child: Padding(
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
              Hero(
                tag: pokemon.pokemon.sprites.other.officialArtwork.frontDefault,
                transitionOnUserGestures: true,
                child: CachedNetworkImage(
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  imageUrl: pokemon
                      .pokemon.sprites.other.officialArtwork.frontDefault,
                  width: 100,
                  height: 100,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            pokemon.pokemon.name.capitalize(),
                            style: TextStyle(
                              color: color == Colors.white
                                  ? Colors.black
                                  : Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: pokemon.pokemon.types.length,
                              itemBuilder: (context, index) {
                                return PokedexIconWidget(
                                  type: pokemon.pokemon.types[index].type,
                                );
                              },
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                NumberFormat("'#'000").format(pokemon.id),
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
      ),
    );
  }
}
