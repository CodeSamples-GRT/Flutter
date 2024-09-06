import 'package:app_common/consts.dart';
import 'package:app_common/data.dart';
import 'package:app_common/theme.dart';
import 'package:flutter/material.dart';
import 'package:localization/l10n/localizable_strings.dart';
import 'package:network/network.dart';

class DeliveryCreditCardMolecule extends StatelessWidget {
  const DeliveryCreditCardMolecule({
    required this.historyEventType,
    required this.paymentEventValue,
    required this.paymentEventDescription,
    this.explanation,
    this.eventDateTime,
    this.amount,
    super.key,
  });

  final PaymentHistoryEventType historyEventType;
  final String? explanation;
  final DateTime? eventDateTime;
  final String? paymentEventValue;
  final String? paymentEventDescription;
  final double? amount;

  static const _margin = 8.0;
  static const _borderRadius = 12.0;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final paymentEventColor = _getTextColor(context);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.padding24,
        vertical: AppDimensions.padding16,
      ),
      margin: const EdgeInsets.all(_margin),
      decoration: BoxDecoration(
        color: AppColors.backgroundPrimary,
        borderRadius: BorderRadius.circular(_borderRadius),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _getTitle(localizations),
                  style: TextStyles.calloutMedium.copyWith(
                    color: AppColors.labelPrimary,
                  ),
                ),
                if (paymentEventDescription != null)
                  Text(
                    paymentEventDescription!,
                    style: TextStyles.calloutRegular.copyWith(
                      color: paymentEventColor,
                    ),
                  ),
                if (eventDateTime != null)
                  Padding(
                    padding: const EdgeInsets.only(top: AppDimensions.padding2),
                    child: Text(
                      DateFormats.timeFormat.format(eventDateTime!),
                      style: TextStyles.captionRegular.copyWith(
                        color: AppColors.labelSecondary,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: AppDimensions.padding8),
          if (paymentEventValue != null)
            Text(
              paymentEventValue!,
              style: TextStyles.calloutMedium.copyWith(
                color: paymentEventColor,
              ),
            ),
        ],
      ),
    );
  }

  Color _getTextColor(BuildContext context) {
    if (amount == null) {
      return AppColors.labelSecondary;
    }
    if (amount! > 0) {
      return AppColors.positiveImpressionPrimary;
    } else {
      return AppColors.positiveImpressionPrimary;
    }
  }

  String _getTitle(AppLocalizations localizations) {
    switch (historyEventType) {
      case PaymentHistoryEventType.creditPurchase:
        return localizations.creditPurchaseEventTypeTitle;
      case PaymentHistoryEventType.refund:
        return localizations.creditRefundEventTypeTitle;
      case PaymentHistoryEventType.ticketsPurchased:
        return localizations.ticketPurchasedEventTypeTitle;
      case PaymentHistoryEventType.canceled:
        return localizations.deliveryCancelEventTypeTitle;
      case PaymentHistoryEventType.noShowPickup:
        return localizations.historyDeliveryStatusNoShowPickup;
      case PaymentHistoryEventType.noShowDropoff:
        return localizations.historyDeliveryStatusNoShowDropoff;
      case PaymentHistoryEventType.refundCredit:
        return localizations.creditRefundEventTypeTitle;
      case PaymentHistoryEventType.subscriptionPurchase:
      case PaymentHistoryEventType.subscriptionRefund:
      case PaymentHistoryEventType.delivery:

      case PaymentHistoryEventType.ticketsRefund:
      case PaymentHistoryEventType.unknown:
        // TODO(paul): Handle these cases properly.
        return explanation ?? '';
    }
  }
}
