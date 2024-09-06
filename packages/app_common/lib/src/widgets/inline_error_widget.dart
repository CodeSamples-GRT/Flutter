import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../theme/colors.dart';
import '../theme/text_styles.dart';

class InlineErrorWidget extends StatelessWidget {
  const InlineErrorWidget({
    required this.errorMessage,
    this.alignment = Alignment.center,
    this.padding = const EdgeInsets.only(bottom: 16),
    super.key,
  });

  final String errorMessage;
  final Alignment alignment;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    SemanticsService.announce(errorMessage, TextDirection.ltr);
    return Semantics(
      liveRegion: true,
      label: errorMessage,
      child: Padding(
        padding: padding,
        child: Text(
          errorMessage,
          style: TextStyles.captionRegular.copyWith(
            color: AppColors.negativeImpressionPrimary,
          ),
        ),
      ),
    );
  }
}
