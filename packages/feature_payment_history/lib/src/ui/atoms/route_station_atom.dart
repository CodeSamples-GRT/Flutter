import 'package:app_common/theme.dart';
import 'package:flutter/material.dart';

class RouteStationAtom extends StatelessWidget {
  const RouteStationAtom(
    this.station, {
    super.key,
  });

  final String station;

  @override
  Widget build(BuildContext context) => Text(
        station,
        style: TextStyles.captionRegular
            .copyWith(color: AppColors.labelPrimary),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      );
}
