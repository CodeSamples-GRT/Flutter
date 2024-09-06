// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_history_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentHistoryResponse _$PaymentHistoryResponseFromJson(
        Map<String, dynamic> json) =>
    PaymentHistoryResponse(
      (json['payment_events'] as List<dynamic>?)
          ?.map((e) => PaymentHistoryEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

PaymentHistoryEvent _$PaymentHistoryEventFromJson(Map<String, dynamic> json) =>
    PaymentHistoryEvent(
      eventType: $enumDecode(
          _$PaymentHistoryEventTypeEnumMap, json['eventType'],
          unknownValue: PaymentHistoryEventType.unknown),
      amount: (json['amount'] as num?)?.toDouble(),
      currencySign: json['currencySign'] as String?,
      failed: json['failed'] as bool?,
      eventTs: (json['eventTs'] as num?)?.toDouble(),
      creditBalance: json['creditBalance'] as String?,
      waived: json['waived'] as bool?,
      creditAmount: (json['creditAmount'] as num?)?.toInt(),
      postDelivery: json['postDelivery'] as bool?,
      directAmount: (json['directAmount'] as num?)?.toInt(),
      cardFourDigits: json['cardFourDigits'] as String?,
      taxedAmount: (json['taxedAmount'] as num?)?.toInt(),
      untaxedAmount: (json['untaxedAmount'] as num?)?.toInt(),
      taxedBalance: (json['taxedBalance'] as num?)?.toInt(),
      untaxedBalance: (json['untaxedBalance'] as num?)?.toInt(),
      deliveryId: (json['deliveryId'] as num?)?.toInt(),
      deliveryCost: (json['deliveryCost'] as num?)?.toDouble(),
      paymentMethodType: $enumDecodeNullable(
          _$PaymentMethodTypeEnumMap, json['paymentMethodType']),
      paymentMethodName: json['paymentMethodName'] as String?,
      eventDescription: json['eventDescription'] as String?,
      eventTypeDescription: json['eventTypeDescription'] as String?,
      explanation: json['explanation'] as String?,
      amountStr: json['amountStr'] as String?,
      creditAmountStr: json['creditAmountStr'] as String?,
      directAmountStr: json['directAmountStr'] as String?,
      taxedAmountStr: json['taxedAmountStr'] as String?,
      untaxedAmountStr: json['untaxedAmountStr'] as String?,
      creditCardProvider: json['creditCardProvider'] as String?,
      deliveryDetails: json['deliveryDetails'] == null
          ? null
          : DeliveryDetails.fromJson(
              json['deliveryDetails'] as Map<String, dynamic>),
      paymentId: (json['paymentId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PaymentHistoryEventToJson(
        PaymentHistoryEvent instance) =>
    <String, dynamic>{
      'currencySign': instance.currencySign,
      'amount': instance.amount,
      'waived': instance.waived,
      'failed': instance.failed,
      'eventType': _$PaymentHistoryEventTypeEnumMap[instance.eventType]!,
      'eventTs': instance.eventTs,
      'creditBalance': instance.creditBalance,
      'postDelivery': instance.postDelivery,
      'creditAmount': instance.creditAmount,
      'directAmount': instance.directAmount,
      'cardFourDigits': instance.cardFourDigits,
      'taxedAmount': instance.taxedAmount,
      'untaxedAmount': instance.untaxedAmount,
      'taxedBalance': instance.taxedBalance,
      'untaxedBalance': instance.untaxedBalance,
      'deliveryId': instance.deliveryId,
      'deliveryCost': instance.deliveryCost,
      'paymentMethodType':
          _$PaymentMethodTypeEnumMap[instance.paymentMethodType],
      'paymentMethodName': instance.paymentMethodName,
      'eventDescription': instance.eventDescription,
      'eventTypeDescription': instance.eventTypeDescription,
      'explanation': instance.explanation,
      'amountStr': instance.amountStr,
      'creditAmountStr': instance.creditAmountStr,
      'directAmountStr': instance.directAmountStr,
      'taxedAmountStr': instance.taxedAmountStr,
      'untaxedAmountStr': instance.untaxedAmountStr,
      'creditCardProvider': instance.creditCardProvider,
      'deliveryDetails': instance.deliveryDetails,
      'paymentId': instance.paymentId,
    };

const _$PaymentHistoryEventTypeEnumMap = {
  PaymentHistoryEventType.unknown: 'unknown',
  PaymentHistoryEventType.delivery: 'delivery',
  PaymentHistoryEventType.canceled: 'canceled',
  PaymentHistoryEventType.noShowPickup: 'noShowPickup',
  PaymentHistoryEventType.noShowDropoff: 'noShowDropoff',
  PaymentHistoryEventType.refund: 'refund',
  PaymentHistoryEventType.creditPurchase: 'creditPurchase',
  PaymentHistoryEventType.refundCredit: 'refundCredit',
  PaymentHistoryEventType.subscriptionPurchase: 'subscriptionPurchase',
  PaymentHistoryEventType.subscriptionRefund: 'subscriptionRefund',
  PaymentHistoryEventType.ticketsPurchased: 'ticketsPurchased',
  PaymentHistoryEventType.ticketsRefund: 'ticketsRefund',
};

const _$PaymentMethodTypeEnumMap = {
  PaymentMethodType.unknown: 'unknown',
  PaymentMethodType.creditCard: 'creditCard',
  PaymentMethodType.googlePay: 'googlePay',
  PaymentMethodType.applePay: 'applePay',
  PaymentMethodType.payPal: 'payPal',
  PaymentMethodType.venmo: 'venmo',
  PaymentMethodType.opalPay: 'opalPay',
  PaymentMethodType.cash: 'cash',
  PaymentMethodType.vaultedCreditCard: 'vaultedCreditCard',
  PaymentMethodType.voucher: 'voucher',
  PaymentMethodType.sepa: 'sepa',
  PaymentMethodType.nrcc: 'nrcc',
};
