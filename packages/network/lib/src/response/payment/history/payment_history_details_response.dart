import 'package:json_annotation/json_annotation.dart';

import '../../common/delivery_details.dart';

part 'payment_history_details_response.g.dart';

@JsonSerializable(createToJson: false)
class PaymentHistoryDetailsResponse {
  const PaymentHistoryDetailsResponse(this.purchaseDetails);

  factory PaymentHistoryDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentHistoryDetailsResponseFromJson(json);

  final DeliveryDetails? purchaseDetails;
}
