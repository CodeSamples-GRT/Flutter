import 'package:app_common/theme.dart';
import 'package:flutter/material.dart';
import 'package:localization/l10n/localizable_strings.dart';
import 'package:network/network.dart';

class HistoryDeliveryStatusAtom extends StatelessWidget {
  const HistoryDeliveryStatusAtom({
    required this.status,
    super.key,
  });

  final PaymentHistoryEventType status;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    switch (status) {
      case PaymentHistoryEventType.delivery:
        return _buildStatusText(
          localizations.historyDeliveryStatusCompleted,
          AppColors.positiveImpressionPrimary,
        );
      case PaymentHistoryEventType.canceled:
        return _buildStatusText(
          localizations.historyDeliveryStatusCanceled,
          AppColors.positiveImpressionPrimary,
        );
      case PaymentHistoryEventType.noShowPickup:
        return _buildStatusText(
          localizations.historyDeliveryStatusNoShowPickup,
          AppColors.negativeImpressionPrimary,
        );
      case PaymentHistoryEventType.noShowDropoff:
        return _buildStatusText(
          localizations.historyDeliveryStatusNoShowDropoff,
          AppColors.negativeImpressionPrimary,
        );

      case PaymentHistoryEventType.unknown:
      case PaymentHistoryEventType.refund:
      case PaymentHistoryEventType.creditPurchase:
      case PaymentHistoryEventType.refundCredit:
      case PaymentHistoryEventType.subscriptionPurchase:
      case PaymentHistoryEventType.subscriptionRefund:
      case PaymentHistoryEventType.ticketsPurchased:
      case PaymentHistoryEventType.ticketsRefund:
        // TODO(paul): Handle these cases properly.
        return const SizedBox();
    }
  }

  Widget _buildStatusText(String text, Color color) => Text(
        text,
        style: TextStyles.calloutMedium.copyWith(color: color),
      );
}
