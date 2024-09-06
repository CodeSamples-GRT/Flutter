import 'package:app_common/theme.dart';
import 'package:flutter/material.dart';

class PaymentDetail extends StatelessWidget {
  const PaymentDetail({
    required this.title,
    required this.cost,
    this.bold,
    super.key,
  });

  final String title;
  final String cost;
  final bool? bold;

  @override
  Widget build(BuildContext context) {
    final normalStyle =
        TextStyles.calloutRegular.copyWith(color: AppColors.labelSecondary);
    final boldStyle =
        TextStyles.calloutMedium.copyWith(color: AppColors.labelPrimary);
    final style = bold == true ? boldStyle : normalStyle;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: style,
        ),
        Text(
          cost,
          textAlign: TextAlign.end,
          style: style,
        ),
      ],
    );
  }
}
