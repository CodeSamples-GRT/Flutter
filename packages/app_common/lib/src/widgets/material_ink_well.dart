import 'package:flutter/material.dart';

import '../theme/colors.dart';

class MaterialInkWell extends StatelessWidget {
  const MaterialInkWell({
    super.key,
    this.child,
    this.onTap,
    this.backgroundColor = Colors.transparent,
    this.borderRadius,
    this.focusNode,
  });

  final Widget? child;
  final VoidCallback? onTap;
  final Color backgroundColor;
  final BorderRadius? borderRadius;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) => Material(
        borderOnForeground: false,
        color: backgroundColor,
        borderRadius: borderRadius,
        child: InkWell(
          focusNode: focusNode,
          borderRadius: borderRadius,
          hoverColor: AppColors.selectorSecondary,
          focusColor: AppColors.selectorSecondary,
          onTap: onTap,
          child: child,
        ),
      );
}
