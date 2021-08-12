import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon/type.dart';

import '../pokedex_app_icons.dart';

class PokedexIconWidget extends StatelessWidget {
  final Type type;

  const PokedexIconWidget({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        width: 28,
        height: 28,
        alignment: Alignment.topCenter,
        child: CircleAvatar(
          child: Icon(
            getIcon(type.name),
            color: Colors.white,
            size: 16,
          ),
          backgroundColor: getColor(type.name),
        ),
      ),
    );
  }

  IconData getIcon(String icon) {
    switch (icon) {
      case 'fighting':
        return PokedexApp.fighting;
      case 'fire':
        return PokedexApp.fire;
      case 'flying':
        return PokedexApp.flying;
      case 'ghost':
        return PokedexApp.ghost;
      case 'grass':
        return PokedexApp.grass;
      case 'ground':
        return PokedexApp.ground;
      case 'ice':
        return PokedexApp.ice;
      case 'normal':
        return PokedexApp.normal;
      case 'poison':
        return PokedexApp.poison;
      case 'psychic':
        return PokedexApp.psychic;
      case 'rock':
        return PokedexApp.rock;
      case 'steel':
        return PokedexApp.steel;
      case 'water':
        return PokedexApp.water;
      case 'bug':
        return PokedexApp.bug;
      case 'electric':
        return PokedexApp.electric;
      case 'dragon':
        return PokedexApp.dragon;
      case 'dark':
        return PokedexApp.dark;
      case 'fairy':
        return PokedexApp.fairy;

      default:
        return PokedexApp.fighting;
    }
  }

  Color getColor(String icon) {
    switch (icon) {
      case 'fighting':
        return Color(0xFFD3425F);
      case 'fire':
        return Color(0xFFFBA54C);
      case 'flying':
        return Color(0xFFA1BBEC);
      case 'ghost':
        return Color(0xFF5F6DBC);
      case 'grass':
        return Color(0xFF5FBD58);
      case 'ground':
        return Color(0xFFDA7C4D);
      case 'ice':
        return Color(0xFF75D0C1);
      case 'normal':
        return Color(0xFFA0A29F);
      case 'poison':
        return Color(0xFFB763CF);
      case 'psychic':
        return Color(0xFFFA8581);
      case 'rock':
        return Color(0xFFC9BB8A);
      case 'steel':
        return Color(0xFF5695A3);
      case 'water':
        return Color(0xFF539DDF);
      case 'bug':
        return Color(0xFF92BC2C);
      case 'electric':
        return Color(0xFFF2D94E);
      case 'dragon':
        return Color(0xFF0C69C8);
      case 'dark':
        return Color(0xFF595761);
      case 'fairy':
        return Color(0xFFEE90E6);

      default:
        return Colors.transparent;
    }
  }
}
