import 'package:flutter/material.dart';


BoxDecoration getBoxDecoration({Color? color, Gradient? gradient, DecorationImage? image, BoxShape shape = BoxShape.rectangle, List<BoxShadow>? boxShadow}) {
  return BoxDecoration(
    borderRadius: shape == BoxShape.circle ? null : BorderRadius.circular(4),
    color: color,
    gradient: gradient,
    image: image,
    shape: shape,
    boxShadow: boxShadow,
  );
}