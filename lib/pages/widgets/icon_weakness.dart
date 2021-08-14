import 'package:flutter/material.dart';
import 'package:pokedex/pages/widgets/pokedex_icon_widget.dart';
import 'package:pokedex/models/pokemon/type.dart';

class IconWeaknessWidget extends StatelessWidget {
  final String icon;

  const IconWeaknessWidget({Key? key, required this.icon}) : super(key: key);

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
          "1",
        ),
      ],
    );
  }
}
