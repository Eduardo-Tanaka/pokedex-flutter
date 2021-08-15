import 'package:flutter/material.dart';

import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/models/pokemon/stats.dart';
import 'package:pokedex/pages/widgets/icon_weakness.dart';
import 'package:pokedex/pages/widgets/pokedex_icon_widget.dart';
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
    List<IconWeaknessWidget> _listWeakness(Pokemon pokemon) {
      List<IconWeaknessWidget> list = [];
      Map<String, String> doubles = Map();
      Map<String, String> halves = Map();

      pokemon.types.forEach(
        (element) {
          element.damageRelations.doubleDamageFrom.forEach(
            (el) {
              if (doubles.containsKey(el.name)) {
                doubles[el.name] = '4';
              } else {
                doubles[el.name] = '2';
              }
            },
          );

          element.damageRelations.halfDamageFrom.forEach(
            (el) {
              if (halves.containsKey(el.name)) {
                halves[el.name] = '\u00bc';
              } else {
                halves[el.name] = '\u00bd';
              }
            },
          );
        },
      );

      doubles.entries.forEach(
        (element) {
          list.add(
            IconWeaknessWidget(
              icon: element.key,
              value: element.value,
            ),
          );
        },
      );

      halves.entries.forEach(
        (element) {
          list.add(
            IconWeaknessWidget(
              icon: element.key,
              value: element.value,
            ),
          );
        },
      );

      PokedexIconWidget.icons.forEach(
        (element) {
          if (!halves.keys.contains(element) &&
              !doubles.keys.contains(element)) {
            list.add(
              IconWeaknessWidget(
                icon: element,
                value: '1',
              ),
            );
          }
        },
      );

      list.sort((a, b) => a.value.hashCode);
      return list;
    }

    final _weakness = _listWeakness(pokemon);

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
          children: _listStats(pokemon),
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
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _weakness.getRange(0, 6).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _weakness.getRange(6, 12).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _weakness.getRange(12, 18).toList(),
              ),
            ),
          ],
        )
      ],
    );
  }

  List<RowDataWidget> _listStats(Pokemon pokemon) {
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
}
