import 'package:flutter/material.dart';

class LinearProgressIndicatorAnimated extends StatefulWidget {
  final Color color;
  final String value;
  final int max;

  const LinearProgressIndicatorAnimated({
    Key? key,
    required this.color,
    required this.value,
    required this.max,
  }) : super(key: key);

  @override
  _LinearProgressIndicatorAnimated createState() =>
      _LinearProgressIndicatorAnimated();
}

class _LinearProgressIndicatorAnimated
    extends State<LinearProgressIndicatorAnimated>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = Tween(
            begin: 0.0, end: (double.tryParse(widget.value) ?? 0) / widget.max)
        .animate(_controller)
          ..addListener(() {
            setState(() {
              // the state that has changed here is the animation object’s value
            });
          });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      color: widget.color,
      backgroundColor: Colors.grey[200],
      value: animation.value,
    );
  }
}
