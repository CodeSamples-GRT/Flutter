import 'package:app_common/theme.dart';
import 'package:flutter/material.dart';

class PriceAtom extends StatelessWidget {
  const PriceAtom({
    required this.price,
    super.key,
  });

  final String price;

  @override
  Widget build(BuildContext context) => Text(
        price,
        style:
            TextStyles.captionRegular.copyWith(color: AppColors.labelPrimary),
        maxLines: 1,
        textAlign: TextAlign.end,
      );
}
