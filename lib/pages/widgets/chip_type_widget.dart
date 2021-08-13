import 'package:flutter/material.dart';
import 'package:pokedex/pages/widgets/pokedex_icon_widget.dart';

class ChipTypeWidget extends StatelessWidget {
  final String name;

  const ChipTypeWidget({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Chip(
        backgroundColor: PokedexIconWidget.getColor(
          name,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              PokedexIconWidget.getIcon(
                name,
              ),
              color: Colors.white,
              size: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                name.toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
