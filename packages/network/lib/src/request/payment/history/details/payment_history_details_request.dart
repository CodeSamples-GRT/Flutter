import 'package:json_annotation/json_annotation.dart';

part 'payment_history_details_request.g.dart';

@JsonSerializable(createFactory: false)
class PaymentHistoryDetailsRequest {
  const PaymentHistoryDetailsRequest({required this.deliveryId});

  final int deliveryId;

  Map<String, dynamic> toJson() => _$PaymentHistoryDetailsRequestToJson(this);
}
