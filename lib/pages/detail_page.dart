import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/extensions/string_extension.dart';
import 'package:pokedex/pages/widgets/about_widget.dart';
import 'package:pokedex/pages/widgets/button_pokedex_widget.dart';
import 'package:pokedex/pages/widgets/evolution_widget.dart';
import 'package:pokedex/pages/widgets/pokedex_icon_widget.dart';

class DetailPage extends StatelessWidget {
  final Pokemon pokemon;
  const DetailPage({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: pokemon.pokemonSpecies.color.name.getColor(),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.keyboard_backspace_outlined)),
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: pokemon.pokemonSpecies.color.name.getColor(),
              border: Border.all(
                  color: pokemon.pokemonSpecies.color.name.getColor(),
                  width: 0.0),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.elliptical(200, 60),
              ),
            ),
            height: 200,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    NumberFormat("'#'000").format(pokemon.id),
                    style: TextStyle(
                      color: pokemon.pokemonSpecies.color.name.getColor() ==
                              Colors.white
                          ? Colors.black.withOpacity(0.4)
                          : Colors.white.withOpacity(0.8),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        pokemon.pokemon.name.capitalize(),
                        style: TextStyle(
                          color: pokemon.pokemonSpecies.color.name.getColor() ==
                                  Colors.white
                              ? Colors.black
                              : Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Hero(
                              tag: pokemon.pokemon.sprites.other.officialArtwork
                                  .frontDefault,
                              transitionOnUserGestures: true,
                              child: CachedNetworkImage(
                                placeholder: (context, url) =>
                                    Center(child: CircularProgressIndicator()),
                                imageUrl: pokemon.pokemon.sprites.other
                                    .officialArtwork.frontDefault,
                                width: 120,
                                height: 120,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonPokedexWidget(
                title: "About",
                onPressed: () {},
              ),
              ButtonPokedexWidget(
                title: "Stats",
                onPressed: () {},
              ),
              ButtonPokedexWidget(
                title: "Evolution",
                onPressed: () {},
              ),
            ],
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: controller,
                children: [
                  Evolution(
                    pokemon: pokemon,
                  ),
                  About(
                    pokemon: pokemon,
                  ),
                  Center(
                    child: Text('Third Page'),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
