import 'package:network/network.dart';

import '../model/payment_history_entity.dart';

class PaymentHistoryMapper {
  const PaymentHistoryMapper();

  List<PaymentHistoryEntity> mapPaymentHistory(
    PaymentHistoryResponse? paymentHistory,
  ) =>
      paymentHistory?.paymentEvents
          ?.map(
            (e) => PaymentHistoryEntity(
              eventDateTime: DateTime.fromMillisecondsSinceEpoch(
                (e.eventTs?.toInt() ?? 0) * 1000,
              ),
              deliveryDetails: mapPaymentDetails(e.deliveryDetails),
              explanation: e.explanation,
              deliveryCostString: e.amountStr,
              eventDescription: e.eventDescription,
              cardFourDigits: e.cardFourDigits,
              eventType: e.eventType,
              deliveryId: e.deliveryId,
              paymentMethodType: e.paymentMethodType,
              paymentMethodName: e.paymentMethodName,
              amount: e.amount,
            ),
          )
          .toList() ??
      [];

  PaymentHistoryDeliveryDetails? mapPaymentDetails(
    DeliveryDetails? deliveryDetails,
  ) {
    if (deliveryDetails != null) {
      return PaymentHistoryDeliveryDetails(
        pickupAddress: deliveryDetails.pickupAddress,
        dropoffAddress: deliveryDetails.dropoffAddress,
        requestTs: deliveryDetails.requestTs,
        driverName: deliveryDetails.driverName,
        pickupTs: deliveryDetails.pickupTs?.toInt(),
      );
    }
    return null;
  }
}
