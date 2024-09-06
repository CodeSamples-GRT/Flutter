import 'package:flutter/material.dart';

import '../../../consts.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';

class EmptyListAtom extends StatelessWidget {
  const EmptyListAtom({
    required this.text,
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppDimensions.padding24),
            child: Semantics(
              liveRegion: true,
              child: Text(
                text,
                style: TextStyles.bodyRegular.copyWith(
                  color: AppColors.labelPrimary,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      );
}
