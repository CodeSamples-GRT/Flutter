import 'package:app_common/consts.dart';
import 'package:app_common/theme.dart';
import 'package:flutter/material.dart';

import '../atoms/route_station_atom.dart';
import '../nonatomic/route_station_vertical_line.dart';

class RouteStationsList extends StatelessWidget {
  const RouteStationsList({
    required this.pickup,
    required this.dropoff,
    this.departAt,
    this.arriveBy,
    super.key,
  });

  final String? pickup;
  final String? dropoff;
  final String? departAt;
  final String? arriveBy;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: AppDimensions.padding16),
        child: arriveBy != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildStationsRow(context),
                  if (arriveBy != null)
                    _buildArriveBySubtitle(context, arriveBy!),
                ],
              )
            : _buildStationsRow(context),
      );

  Widget _buildStationsRow(BuildContext context) => IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const RouteStationVerticalLine(),
            const SizedBox(width: AppDimensions.padding8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (pickup != null) RouteStationAtom(pickup!),
                  if (departAt != null)
                    Text(
                      departAt!,
                      style: TextStyles.captionRegular.copyWith(
                        color: AppColors.labelSecondary,
                      ),
                    ),
                  const SizedBox(height: AppDimensions.padding16),
                  if (dropoff != null) RouteStationAtom(dropoff!),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _buildArriveBySubtitle(
    BuildContext context,
    String arriveBy,
  ) =>
      Padding(
        padding:
            const EdgeInsetsDirectional.only(start: AppDimensions.padding24),
        child: Text(
          arriveBy,
          style: TextStyles.captionRegular
              .copyWith(color: AppColors.labelSecondary),
        ),
      );
}
