import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import '../centered_page_scaffold.dart' show bigScreenCardWidth;

class CardContainerAtom extends StatelessWidget {
  const CardContainerAtom({
    required this.child,
    this.padding = EdgeInsets.zero,
    this.maxHeight,
    super.key,
  });

  static const _borderRadius = 12.0;

  final Widget child;
  final EdgeInsets padding;
  final double? maxHeight;

  @override
  Widget build(BuildContext context) => Container(
        clipBehavior: Clip.antiAlias,
        padding: padding,
        constraints: BoxConstraints(
          maxWidth: bigScreenCardWidth,
          maxHeight: maxHeight ?? double.infinity,
        ),
        decoration: const BoxDecoration(
          color: AppColors.backgroundPrimary,
          borderRadius: BorderRadius.all(Radius.circular(_borderRadius)),
        ),
        child: child,
      );
}
