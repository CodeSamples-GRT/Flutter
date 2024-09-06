// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_history_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentHistoryDetailsResponse _$PaymentHistoryDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    PaymentHistoryDetailsResponse(
      json['purchaseDetails'] == null
          ? null
          : DeliveryDetails.fromJson(
              json['purchaseDetails'] as Map<String, dynamic>),
    );
