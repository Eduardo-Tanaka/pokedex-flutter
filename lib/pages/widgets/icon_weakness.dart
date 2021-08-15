import 'package:flutter/material.dart';

import 'package:pokedex/models/pokemon/type.dart';
import 'package:pokedex/pages/widgets/pokedex_icon_widget.dart';

class IconWeaknessWidget extends StatelessWidget {
  final String icon;
  final String value;

  const IconWeaknessWidget({
    Key? key,
    required this.icon,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 9),
          child: PokedexIconWidget(
            type: Type(name: icon, url: ''),
          ),
        ),
        Text(
          value,
        ),
      ],
    );
  }
}
