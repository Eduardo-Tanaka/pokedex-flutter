import 'package:flutter/material.dart';

class RowDataWidget extends StatelessWidget {
  final String title;
  final String value;
  final bool showStatsBar;

  const RowDataWidget({
    Key? key,
    required this.title,
    required this.value,
    this.showStatsBar = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          SizedBox(
            width: 90,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.green,
            ),
          ),
          Visibility(
            visible: showStatsBar,
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: LinearProgressIndicator(
                  color: Colors.green,
                  backgroundColor: Colors.grey[200],
                  value: double.tryParse(value),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
