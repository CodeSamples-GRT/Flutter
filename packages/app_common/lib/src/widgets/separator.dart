import 'package:flutter/material.dart';

const _thicknessThin = 1.0;

class Separator extends StatelessWidget {
  const Separator._({
    required this.thickness,
    required this.color,
    required this.size,
    required this.orientation,
    this.indent,
    this.endIndent,
  });

  factory Separator.horizontal({
    double height = 0,
    double thickness = _thicknessThin,
    double? indent,
    double? endIndent,
    Color? color,
  }) =>
      Separator._(
        orientation: Axis.horizontal,
        thickness: thickness,
        size: height,
        indent: indent,
        endIndent: endIndent,
        color: color,
      );

  factory Separator.vertical({
    double width = 0,
    double thickness = _thicknessThin,
    double? indent,
    double? endIndent,
    Color? color,
  }) =>
      Separator._(
        orientation: Axis.vertical,
        thickness: thickness,
        size: width,
        indent: indent,
        endIndent: endIndent,
        color: color,
      );

  final Axis orientation;
  final double thickness;
  final double? size;
  final double? indent;
  final double? endIndent;
  final Color? color;

  @override
  Widget build(BuildContext context) => orientation == Axis.horizontal
      ? Divider(
          color: color,
          endIndent: endIndent,
          height: size,
          indent: indent,
          thickness: thickness,
        )
      : VerticalDivider(
          color: color,
          endIndent: endIndent,
          width: size,
          indent: indent,
          thickness: thickness,
        );
}
