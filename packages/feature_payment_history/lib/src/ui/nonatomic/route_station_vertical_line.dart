import 'package:app_common/theme.dart';
import 'package:flutter/material.dart';

import 'route_station_circle_point.dart';

class RouteStationVerticalLine extends StatelessWidget {
  const RouteStationVerticalLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const RouteStationCirclePoint(),
            Expanded(
              child: Container(
                margin: const EdgeInsetsDirectional.only(start: 4),
                color: AppColors.labelPrimary,
                width: 2,
                alignment: Alignment.center,
              ),
            ),
            const RouteStationCirclePoint(),
          ],
        ),
      );
}
