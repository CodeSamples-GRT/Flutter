import 'package:flutter/material.dart';

class RouteStationCirclePoint extends StatelessWidget {
  const RouteStationCirclePoint({super.key});

  static const _size = 10.0;
  static const _borderWidth = 2.0;

  @override
  Widget build(BuildContext context) => Container(
        height: _size,
        width: _size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: _borderWidth,
          ),
        ),
      );
}
