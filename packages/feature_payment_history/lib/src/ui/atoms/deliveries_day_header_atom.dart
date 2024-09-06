import 'package:app_common/consts.dart';
import 'package:app_common/data.dart';
import 'package:app_common/theme.dart';
import 'package:flutter/material.dart';

class DeliveriesDayHeaderAtom extends StatelessWidget {
  const DeliveriesDayHeaderAtom({
    required this.dateTime,
    super.key,
  });

  final DateTime dateTime;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsetsDirectional.only(
          top: AppDimensions.padding32,
          bottom: AppDimensions.padding8,
        ),
        child: Text(
          DateFormats.dayDateTime.format(
            dateTime,
          ),
          style: TextStyles.captionRegular
              .copyWith(color: AppColors.labelSecondary),
        ),
      );
}
