import 'package:flutter/material.dart';

import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/models/pokemon/stats.dart';
import 'package:pokedex/pages/widgets/icon_weakness.dart';
import 'package:pokedex/pages/widgets/row_data_widget.dart';
import 'package:pokedex/models/pokemon/stat.dart';
import 'package:pokedex/extensions/string_extension.dart';

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
        Column(
          children: listStats(pokemon),
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
            IconWeaknessWidget(icon: 'water'),
            IconWeaknessWidget(icon: 'water'),
            IconWeaknessWidget(icon: 'water'),
            IconWeaknessWidget(icon: 'water'),
            IconWeaknessWidget(icon: 'water'),
            IconWeaknessWidget(icon: 'water'),
          ],
        )
      ],
    );
  }

  List<RowDataWidget> listStats(Pokemon pokemon) {
    List<RowDataWidget> rows = [];
    // calculate stats https://bulbapedia.bulbagarden.net/wiki/Stat
    Stats _maxStats = pokemon.pokemon.stats
        .reduce((curr, next) => curr.baseStat > next.baseStat ? curr : next);
    int _max = (_maxStats.stat.name == 'hp'
            ? 110 + (2 * _maxStats.baseStat)
            : (5 + (2 * _maxStats.baseStat)) * 0.9)
        .floor();
    pokemon.pokemon.stats.forEach(
      (element) {
        rows.add(
          RowDataWidget(
            title: element.stat.value,
            value: element.baseStat.toString(),
            color: pokemon.pokemonSpecies.color.name.getColor(),
            showStatsBar: true,
            max: _max,
          ),
        );
      },
    );
    return rows;
  }

  List<IconWeaknessWidget> listWeakness(Pokemon pokemon) {
    List<IconWeaknessWidget> list = [];
    return list;
  }
}
