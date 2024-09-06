import 'package:app_common/consts.dart';
import 'package:app_common/theme.dart';
import 'package:flutter/material.dart';
import 'package:localization/l10n/localizable_strings.dart';
import 'package:network/network.dart';

import 'history_details_section_molecule.dart';
import 'payment_detail.dart';

class DeliveryPaymentDetails extends StatelessWidget {
  const DeliveryPaymentDetails({
    required this.paymentMethodType,
    this.cardFourDigits,
    this.deliveryCostString,
    this.paymentMethodName,
    super.key,
  });

  final String? cardFourDigits;
  final String? deliveryCostString;
  final PaymentMethodType paymentMethodType;
  final String? paymentMethodName;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: AppDimensions.padding16),
          child: Text(
            paymentMethodType == PaymentMethodType.creditCard
                ? '$paymentMethodName: $cardFourDigits'
                : paymentMethodName ?? paymentMethodType.name,
            style: TextStyles.headlineMedium.copyWith(
              color: AppColors.labelPrimary,
            ),
          ),
        ),
        const SizedBox(height: AppDimensions.padding24),
        if (paymentMethodName != null) ...[
          HistoryDetailsSectionMolecule(
            title: localizations.paymentMethod,
            subtitle: paymentMethodName,
          ),
          const SizedBox(height: AppDimensions.padding16),
        ],
        if (deliveryCostString != null)
          PaymentDetail(
            title: localizations.historyPaymentTotal,
            cost: deliveryCostString!,
            bold: true,
          ),
      ],
    );
  }
}
