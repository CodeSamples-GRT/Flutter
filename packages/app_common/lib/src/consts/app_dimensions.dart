import 'package:flutter/widgets.dart';

abstract class AppDimensions {
  static const padding2 = 2.0;
  static const padding4 = 4.0;
  static const padding8 = 8.0;
  static const padding16 = 16.0;
  static const padding24 = 24.0;
  static const padding32 = 32.0;
  static const padding40 = 40.0;
}

enum AppRadius {
  radius0(0),
  radius2(2),
  radius4(4),
  radius8(8),
  radius12(12),
  radius16(16),
  radius24(24),
  radius32(32);

  const AppRadius(this.radius);

  final double radius;

  BorderRadius get borderRadius => BorderRadius.all(
        Radius.circular(
          radius,
        ),
      );
}
