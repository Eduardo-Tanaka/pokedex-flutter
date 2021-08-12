import 'package:flutter/material.dart';

class CardHomePlaceholderWidget extends StatelessWidget {
  const CardHomePlaceholderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: Colors.black, width: 0.0),
          borderRadius: BorderRadius.all(Radius.elliptical(16, 16)),
        ),
        height: 100,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
