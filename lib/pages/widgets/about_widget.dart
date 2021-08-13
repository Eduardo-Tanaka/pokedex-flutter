import 'package:flutter/material.dart';

import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/models/pokemon/types.dart';
import 'package:pokedex/pages/widgets/row_data_widget.dart';

import 'chip_type_widget.dart';

class About extends StatelessWidget {
  final Pokemon pokemon;

  const About({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "asd s das asd asd asd asd asdasd asd asd asd asd asd asd ",
        ),
        Row(
          children: _chips(pokemon.pokemon.types),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          "Pokédex data",
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
          title: 'Height',
          value: '0.7',
        ),
        RowDataWidget(
          title: 'Weight',
          value: '47',
        ),
        RowDataWidget(
          title: 'Gender',
          value: '47',
        ),
        RowDataWidget(
          title: 'Specie',
          value: 'seed',
        ),
      ],
    );
  }

  List<ChipTypeWidget> _chips(List<Types> types) {
    List<ChipTypeWidget> chips = [];
    for (int i = 0; i < types.length; i++) {
      chips.add(
        ChipTypeWidget(
          name: types[i].type.name,
        ),
      );
    }
    return chips;
  }
}
