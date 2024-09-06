
import 'package:app_common/theme.dart';
import 'package:flutter/material.dart';

class HistoryTitleAtom extends StatelessWidget {
  const HistoryTitleAtom({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) => Text(
        title,
        style: TextStyles.captionRegular.copyWith(
          color: AppColors.labelSecondary,
        ),
      );
}
