import 'package:app_common/consts.dart';
import 'package:app_common/theme.dart';
import 'package:app_common/widgets.dart';
import 'package:flutter/material.dart';

import 'delivery_card_bottom_molecule.dart';
import 'route_stations_list.dart';

class DeliveryCardMolecule extends StatelessWidget {
  const DeliveryCardMolecule({
    required this.onTap,
    required this.pickupAddress,
    required this.dropoffAddress,
    required this.deliveryStatusWidget,
    this.deliveryCostString,
    this.onCancelTap,
    this.onEditTap,
    this.onViewTripTap,
    this.departAt,
    this.arriveBy,
    super.key,
  });

  final VoidCallback onTap;
  final String? pickupAddress;
  final String? dropoffAddress;
  final String? deliveryCostString;
  final Widget deliveryStatusWidget;
  final VoidCallback? onCancelTap;
  final VoidCallback? onViewTripTap;
  final VoidCallback? onEditTap;
  final String? departAt;
  final String? arriveBy;

  @override
  Widget build(BuildContext context) => Card(
        color: AppColors.backgroundPrimary,
        elevation: 3,
        shadowColor: AppColors.selectorPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.radius12.borderRadius,
        ),
        child: Semantics(
          button: true,
          child: InkWell(
            borderRadius: AppRadius.radius12.borderRadius,
            focusColor: AppColors.selectorSecondary,
            hoverColor: AppColors.selectorSecondary,
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.padding24,
                vertical: AppDimensions.padding16,
              ),
              child: Column(
                children: [
                  MergeSemantics(
                    child: RouteStationsList(
                      pickup: pickupAddress,
                      dropoff: dropoffAddress,
                      departAt: departAt,
                      arriveBy: arriveBy,
                    ),
                  ),
                  _getDivider(context),
                  const SizedBox(height: AppDimensions.padding16),
                  MergeSemantics(
                    child: DeliveryCardBottomMolecule(
                      deliveryStatusWidget: deliveryStatusWidget,
                      deliveryCostString: deliveryCostString,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  Widget _getDivider(BuildContext context) => Separator.horizontal(
        color: AppColors.selectorSecondary,
      );
}
