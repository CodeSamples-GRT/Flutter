import 'package:app_common/data.dart';
import 'package:localization/l10n/localizable_strings.dart';

import '../model/payment_history_entity.dart';

class DeliveriesTextFormatter {
  const DeliveriesTextFormatter._();

  static String? formatHistoryDepartAtLongForm(
    PaymentHistoryEntity paymentHistoryEntity,
    AppLocalizations localise,
  ) {
    final pickupTs = paymentHistoryEntity.deliveryDetails?.pickupTs;
    if (pickupTs == null) {
      return null;
    }

    final pickupTime = DateFormats.timeFormat.format(
      DateTime.fromMillisecondsSinceEpoch(pickupTs * 1000),
    );

    return pickupTime;
  }
}
