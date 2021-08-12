import 'package:flutter/material.dart';

class ButtonPokedexWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const ButtonPokedexWidget({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: TextButton.styleFrom(
        primary: Colors.black87,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
          side: BorderSide(
            color: Colors.grey[200]!,
            style: BorderStyle.solid,
          ),
        ),
        shadowColor: Colors.grey,
      ),
    );
  }
}
