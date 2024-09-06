import 'package:json_annotation/json_annotation.dart';

part 'delivery_details.g.dart';

@JsonSerializable()
class DeliveryDetails {
  const DeliveryDetails({
    this.id,
    this.pickupAddress,
    this.dropoffAddress,
    this.pickupTs,
    this.requestTs,
    this.driverName,
  });

  factory DeliveryDetails.fromJson(Map<String, dynamic> json) =>
      _$DeliveryDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryDetailsToJson(this);

  final int? id;
  final String? pickupAddress;
  final String? dropoffAddress;
  final double? pickupTs;
  final double? requestTs;
  final String? driverName;
}