import 'package:freezed_annotation/freezed_annotation.dart';

import '../../common/delivery_details.dart';

part 'payment_history_response.g.dart';

@JsonSerializable(createToJson: false)
class PaymentHistoryResponse {
  const PaymentHistoryResponse(this.paymentEvents);

  factory PaymentHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentHistoryResponseFromJson(json);

  @JsonKey(name: 'payment_events')
  final List<PaymentHistoryEvent>? paymentEvents;
}

@JsonSerializable()
class PaymentHistoryEvent {
  PaymentHistoryEvent({
    required this.eventType,
    this.amount,
    this.currencySign,
    this.failed,
    this.eventTs,
    this.creditBalance,
    this.waived,
    this.creditAmount,
    this.postDelivery,
    this.directAmount,
    this.cardFourDigits,
    this.taxedAmount,
    this.untaxedAmount,
    this.taxedBalance,
    this.untaxedBalance,
    this.deliveryId,
    this.deliveryCost,
    this.paymentMethodType,
    this.paymentMethodName,
    this.eventDescription,
    this.eventTypeDescription,
    this.explanation,
    this.amountStr,
    this.creditAmountStr,
    this.directAmountStr,
    this.taxedAmountStr,
    this.untaxedAmountStr,
    this.creditCardProvider,
    this.deliveryDetails,
    this.paymentId,
  });

  factory PaymentHistoryEvent.fromJson(Map<String, dynamic> json) =>
      _$PaymentHistoryEventFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentHistoryEventToJson(this);

  final String? currencySign;
  final double? amount;
  final bool? waived;
  final bool? failed;
  @JsonKey(unknownEnumValue: PaymentHistoryEventType.unknown)
  final PaymentHistoryEventType eventType;
  final double? eventTs;
  final String? creditBalance;
  final bool? postDelivery;
  final int? creditAmount;
  final int? directAmount;
  final String? cardFourDigits;
  final int? taxedAmount;
  final int? untaxedAmount;
  final int? taxedBalance;
  final int? untaxedBalance;
  final int? deliveryId;
  final double? deliveryCost;
  final PaymentMethodType? paymentMethodType;
  final String? paymentMethodName;
  final String? eventDescription;
  final String? eventTypeDescription;
  final String? explanation;
  final String? amountStr;
  final String? creditAmountStr;
  final String? directAmountStr;
  final String? taxedAmountStr;
  final String? untaxedAmountStr;
  final String? creditCardProvider;
  final DeliveryDetails? deliveryDetails;
  final int? paymentId;
}

@JsonEnum()
enum PaymentHistoryEventType {
  unknown,
  delivery,
  canceled,
  noShowPickup,
  noShowDropoff,
  refund,
  creditPurchase,
  refundCredit,
  subscriptionPurchase,
  subscriptionRefund,
  ticketsPurchased,
  ticketsRefund,
}

@JsonEnum()
enum PaymentMethodType {
  unknown,
  creditCard,
  googlePay,
  applePay,
  payPal,
  venmo,
  opalPay,
  cash,
  vaultedCreditCard,
  voucher,
  sepa,
  nrcc,
}
