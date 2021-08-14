import 'package:flutter/material.dart';

class RowDataWidget extends StatelessWidget {
  final String title;
  final String value;
  final bool showStatsBar;
  final Color color;
  final int max;

  const RowDataWidget({
    Key? key,
    required this.title,
    required this.value,
    this.showStatsBar = false,
    required this.color,
    this.max = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          Container(
            width: showStatsBar ? 35 : null,
            child: Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: color,
              ),
            ),
          ),
          Visibility(
            visible: showStatsBar,
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: LinearProgressIndicator(
                  color: color,
                  backgroundColor: Colors.grey[200],
                  value: (double.tryParse(this.value) ?? 0) / max,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
