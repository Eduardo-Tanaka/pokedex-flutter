import 'package:flutter/material.dart';

import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/pages/widgets/pokedex_icon_widget.dart';
import 'package:pokedex/pages/widgets/row_data_widget.dart';
import 'package:pokedex/models/pokemon/type.dart';

class StatsWidget extends StatelessWidget {
  final Pokemon pokemon;

  const StatsWidget({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Base Stats",
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        RowDataWidget(
          title: 'HP',
          value: '45',
          showStatsBar: true,
        ),
        RowDataWidget(
          title: 'Attack',
          value: '45',
          showStatsBar: true,
        ),
        RowDataWidget(
          title: 'Defense',
          value: '45',
          showStatsBar: true,
        ),
        RowDataWidget(
          title: 'Sp. Atk.',
          value: '45',
          showStatsBar: true,
        ),
        RowDataWidget(
          title: 'Sp. Def.',
          value: '45',
          showStatsBar: true,
        ),
        RowDataWidget(
          title: 'Speed',
          value: '45',
          showStatsBar: true,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          "Weaknesses",
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        Text(
          "Weakness of each type on",
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            PokedexIconWidget(
              type: Type(name: 'fighting', url: ''),
            ),
            PokedexIconWidget(
              type: Type(name: 'fire', url: ''),
            ),
            PokedexIconWidget(
              type: Type(name: 'flying', url: ''),
            ),
            PokedexIconWidget(
              type: Type(name: 'ghost', url: ''),
            ),
            PokedexIconWidget(
              type: Type(name: 'grass', url: ''),
            ),
            PokedexIconWidget(
              type: Type(name: 'ground', url: ''),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            PokedexIconWidget(
              type: Type(name: 'ice', url: ''),
            ),
            PokedexIconWidget(
              type: Type(name: 'normal', url: ''),
            ),
            PokedexIconWidget(
              type: Type(name: 'poison', url: ''),
            ),
            PokedexIconWidget(
              type: Type(name: 'psychic', url: ''),
            ),
            PokedexIconWidget(
              type: Type(name: 'rock', url: ''),
            ),
            PokedexIconWidget(
              type: Type(name: 'steel', url: ''),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            PokedexIconWidget(
              type: Type(name: 'water', url: ''),
            ),
            PokedexIconWidget(
              type: Type(name: 'bug', url: ''),
            ),
            PokedexIconWidget(
              type: Type(name: 'electric', url: ''),
            ),
            PokedexIconWidget(
              type: Type(name: 'dragon', url: ''),
            ),
            PokedexIconWidget(
              type: Type(name: 'dark', url: ''),
            ),
            PokedexIconWidget(
              type: Type(name: 'fairy', url: ''),
            ),
          ],
        )
      ],
    );
  }
}
