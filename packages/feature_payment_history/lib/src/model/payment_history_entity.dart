import 'package:network/network.dart';

class PaymentHistoryEntity{
  const PaymentHistoryEntity({
    required this.eventDateTime,
    required this.deliveryDetails,
    required this.deliveryCostString,
    required this.cardFourDigits,
    required this.eventDescription,
    required this.explanation,
    required this.eventType,
    required this.deliveryId,
    required this.paymentMethodType,
    required this.paymentMethodName,
    required this.amount,
  });

  final PaymentHistoryEventType eventType;
  final DateTime? eventDateTime;
  final PaymentHistoryDeliveryDetails? deliveryDetails;
  final String? deliveryCostString;
  final String? eventDescription;
  final String? explanation;
  final String? cardFourDigits;
  final int? deliveryId;
  final PaymentMethodType? paymentMethodType;
  final String? paymentMethodName;
  final double? amount;

  bool get showPaymentDetails => deliveryCostString?.isNotEmpty == true;
}

class PaymentHistoryDeliveryDetails {
  const PaymentHistoryDeliveryDetails({
    this.pickupAddress,
    this.dropoffAddress,
    this.requestTs,
    this.driverName,
    this.pickupTs,
  });

  final String? pickupAddress;
  final String? dropoffAddress;
  final double? requestTs;
  final String? driverName;
  final int? pickupTs;

}
