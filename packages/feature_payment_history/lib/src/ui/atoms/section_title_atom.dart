import 'package:app_common/theme.dart';
import 'package:flutter/material.dart';

class SectionTitleAtom extends StatelessWidget {
  const SectionTitleAtom({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) => Semantics(
        header: true,
        child: Text(
          title,
          style:
              TextStyles.headlineMedium.copyWith(color: AppColors.labelPrimary),
        ),
      );
}
