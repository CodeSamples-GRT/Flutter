import 'package:app_common/consts.dart';
import 'package:app_common/theme.dart';
import 'package:flutter/material.dart';

import '../atoms/history_title_atom.dart';

class HistoryDetailsSectionMolecule extends StatelessWidget {
  const HistoryDetailsSectionMolecule({
    required this.title,
    required this.subtitle,
    super.key,
  });

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HistoryTitleAtom(title: title),
          const SizedBox(height: AppDimensions.padding4),
          if (subtitle != null)
            Text(
              subtitle!,
              style: TextStyles.captionRegular
                  .copyWith(color: AppColors.labelSecondary),
            ),
        ],
      );
}
