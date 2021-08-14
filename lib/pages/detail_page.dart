import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/extensions/string_extension.dart';
import 'package:pokedex/pages/widgets/about_widget.dart';
import 'package:pokedex/pages/widgets/button_pokedex_widget.dart';
import 'package:pokedex/pages/widgets/detail_page_cubit.dart';
import 'package:pokedex/pages/widgets/evolution_widget.dart';
import 'package:pokedex/pages/widgets/pokedex_icon_widget.dart';
import 'package:pokedex/pages/widgets/stats_widget.dart';

class DetailPage extends StatelessWidget {
  final Pokemon pokemon;
  const DetailPage({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    return BlocProvider(
      create: (_) => DetailPageCubit(0),
      child: Builder(
        builder: (context) {
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
                            color:
                                pokemon.pokemonSpecies.color.name.getColor() ==
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
                                color: pokemon.pokemonSpecies.color.name
                                            .getColor() ==
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
                                    tag: pokemon.pokemon.sprites.other
                                        .officialArtwork.frontDefault,
                                    transitionOnUserGestures: true,
                                    child: CachedNetworkImage(
                                      placeholder: (context, url) => Center(
                                          child: CircularProgressIndicator()),
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
                BlocBuilder<DetailPageCubit, int>(
                  builder: (ctx, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ButtonPokedexWidget(
                          title: "About",
                          onPressed: () {
                            controller.animateToPage(
                              0,
                              duration: Duration(milliseconds: 400),
                              curve: Curves.easeIn,
                            );
                            ctx.read<DetailPageCubit>().change(0);
                          },
                          active: state == 0,
                          color: pokemon.pokemonSpecies.color.name.getColor(),
                        ),
                        ButtonPokedexWidget(
                          title: "Stats",
                          onPressed: () {
                            controller.animateToPage(
                              1,
                              duration: Duration(milliseconds: 400),
                              curve: Curves.easeIn,
                            );
                            ctx.read<DetailPageCubit>().change(1);
                          },
                          active: state == 1,
                          color: pokemon.pokemonSpecies.color.name.getColor(),
                        ),
                        ButtonPokedexWidget(
                          title: "Evolution",
                          onPressed: () {
                            controller.animateToPage(
                              2,
                              duration: Duration(milliseconds: 400),
                              curve: Curves.easeIn,
                            );
                            ctx.read<DetailPageCubit>().change(2);
                          },
                          active: state == 2,
                          color: pokemon.pokemonSpecies.color.name.getColor(),
                        ),
                      ],
                    );
                  },
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: PageView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      controller: controller,
                      onPageChanged: (int page) {
                        context.read<DetailPageCubit>().change(page);
                      },
                      children: [
                        SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: About(
                            pokemon: pokemon,
                          ),
                        ),
                        SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: StatsWidget(
                            pokemon: pokemon,
                          ),
                        ),
                        SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Evolution(
                            pokemon: pokemon,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
