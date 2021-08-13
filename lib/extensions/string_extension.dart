import 'package:flutter/material.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }

  Color getColor() {
    switch (this) {
      case 'green':
        return Colors.green;
      case 'blue':
        return Colors.blue;
      case 'red':
        return Colors.red;
      case 'pink':
        return Colors.pink;
      case 'purple':
        return Colors.purple;
      case 'brown':
        return Colors.brown;
      case 'yellow':
        return Colors.yellow;
      case 'gray':
        return Colors.grey;
      case 'white':
        return Colors.white;
      case 'black':
        return Colors.black;
      default:
        return Colors.transparent;
    }
  }
}
