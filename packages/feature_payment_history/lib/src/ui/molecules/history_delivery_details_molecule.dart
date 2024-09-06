import 'package:app_common/consts.dart';
import 'package:app_common/data.dart';
import 'package:flutter/material.dart';
import 'package:localization/l10n/localizable_strings.dart';

import 'history_details_section_molecule.dart';

class HistoryDeliveryDetailsMolecule extends StatelessWidget {
  const HistoryDeliveryDetailsMolecule({
    required this.pickupTs,
    required this.pickupAddress,
    required this.dropoffAddress,
    required this.driverName,
    required this.showCourierInfo,
    super.key,
  });

  final int? pickupTs;
  final String? pickupAddress;
  final String? dropoffAddress;
  final String? driverName;
  final bool? showCourierInfo;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (pickupAddress != null) ...[
            HistoryDetailsSectionMolecule(
              title: AppLocalizations.of(context).historyDeliveryDetailsOrigin,
              subtitle: pickupAddress,
            ),
          ],
          if (dropoffAddress != null) ...[
            _buildDivider(),
            HistoryDetailsSectionMolecule(
              title: AppLocalizations.of(context)
                  .historyDeliveryDetailsDestination,
              subtitle: dropoffAddress,
            ),
          ],
          if (pickupTs != null) ...[
            _buildDivider(),
            HistoryDetailsSectionMolecule(
              title: AppLocalizations.of(context).historyDeliveryDetailsDate,
              subtitle: DateFormats.longDateTime.format(
                DateTime.fromMillisecondsSinceEpoch(
                  pickupTs! * 1000,
                ),
              ),
            ),
          ],
          if (showCourierInfo == true && driverName != null) ...[
            _buildDivider(),
            HistoryDetailsSectionMolecule(
              title: AppLocalizations.of(context).historyDeliveryDetailsCourier,
              subtitle: driverName,
            ),
          ],
        ],
      );

  Widget _buildDivider() => const SizedBox(height: AppDimensions.padding16);
}
