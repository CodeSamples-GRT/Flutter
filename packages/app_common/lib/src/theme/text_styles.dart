import 'package:flutter/material.dart';

abstract class TextStyles {
  static const largeTitle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 32,
    height: 1.2,
  );

  static const bodyRegular = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    height: 1.3,
  );

  static const headlineMedium = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    height: 1.3,
  );

  static const captionRegular = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 12,
    height: 1.3,
  );

  static const calloutMedium = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14,
    height: 1.4,
  );

  static const calloutRegular = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    height: 1.4,
  );
}
