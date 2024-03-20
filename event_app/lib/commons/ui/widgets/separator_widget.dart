import 'package:flutter/material.dart';

class SeparatorWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  
  const SeparatorWidget({ super.key, this.height, this.width, this.color });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 5, width: width ?? double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: color ?? Theme.of(context).canvasColor,
      ),
    );
  }
}