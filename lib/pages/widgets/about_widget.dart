import 'package:flutter/material.dart';

import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/models/pokemon/types.dart';
import 'package:pokedex/models/pokemon_species/egg_group.dart';
import 'package:pokedex/models/pokemon_species/flavor_text_entry.dart';
import 'package:pokedex/pages/widgets/row_data_widget.dart';

import 'chip_type_widget.dart';
import 'package:pokedex/extensions/string_extension.dart';

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
          getFlavorText(pokemon.pokemonSpecies.flavorTextEntries),
          style: TextStyle(height: 1.2),
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
            color: pokemon.pokemonSpecies.color.name.getColor(),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Flexible(
              flex: 1,
              child: RowDataWidget(
                title: 'Height',
                value: pokemon.pokemon.height.toString(),
                color: pokemon.pokemonSpecies.color.name.getColor(),
              ),
            ),
            Flexible(
              flex: 1,
              child: RowDataWidget(
                title: 'Weight',
                value: pokemon.pokemon.weight.toString(),
                color: pokemon.pokemonSpecies.color.name.getColor(),
              ),
            ),
          ],
        ),
        RowDataWidget(
          title: 'Specie',
          value: getEggGroup(pokemon.pokemonSpecies.eggGroups),
          color: pokemon.pokemonSpecies.color.name.getColor(),
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

  String getEggGroup(List<EggGroup> eggGroups) {
    List<String> list = [];
    eggGroups.forEach((element) {
      list.add(element.name.replaceAll(RegExp(r'[0-9]'), ''));
    });
    return list.join(" / ");
  }

  String getFlavorText(List<FlavorTextEntry> texts) {
    String text = '';
    texts.forEach((element) {
      if (element.version.name == 'ruby' || element.version.name == 'emerald')
        text += element.flavorText.replaceAll("\n", "").replaceAll(".", ".\n");
    });

    return text;
  }
}
