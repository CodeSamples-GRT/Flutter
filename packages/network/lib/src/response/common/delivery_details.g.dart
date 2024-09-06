// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryDetails _$DeliveryDetailsFromJson(Map<String, dynamic> json) =>
    DeliveryDetails(
      id: (json['id'] as num?)?.toInt(),
      pickupAddress: json['pickupAddress'] as String?,
      dropoffAddress: json['dropoffAddress'] as String?,
      pickupTs: (json['pickupTs'] as num?)?.toDouble(),
      requestTs: (json['requestTs'] as num?)?.toDouble(),
      driverName: json['driverName'] as String?,
    );

Map<String, dynamic> _$DeliveryDetailsToJson(DeliveryDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pickupAddress': instance.pickupAddress,
      'dropoffAddress': instance.dropoffAddress,
      'pickupTs': instance.pickupTs,
      'requestTs': instance.requestTs,
      'driverName': instance.driverName,
    };
