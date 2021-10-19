import 'package:flutter/material.dart';

class SeparatorItem extends StatelessWidget {
  final Color color;
  final double height;

  const SeparatorItem({this.color = Colors.transparent, this.height = 0});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color,
      height: height,
    );
  }
}
