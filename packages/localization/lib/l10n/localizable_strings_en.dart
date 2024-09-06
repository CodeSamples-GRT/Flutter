import 'localizable_strings.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Flutter Examples';

  @override
  String get paymentHistoryDetailsTitle => 'Payment details';

  @override
  String get paymentHistoryDetailsContactUs => 'Contact us';

  @override
  String get paymentHistoryTitle => 'Payment history';

  @override
  String get paymentHistoryEmpty => 'No result';

  @override
  String get historyDeliveryStatusCanceled => 'Canceled';

  @override
  String get historyDeliveryStatusCompleted => 'Completed';

  @override
  String get historyDeliveryStatusNoShowPickup => 'No show during pickup';

  @override
  String get historyDeliveryStatusNoShowDropoff => 'No show during drop off';

  @override
  String get creditPurchaseEventTypeTitle => 'Credit purchase';

  @override
  String get creditRefundEventTypeTitle => 'Credit refund';

  @override
  String get refundEventTypeTitle => 'Refund';

  @override
  String get ticketPurchasedEventTypeTitle => 'Tickets Purchased';

  @override
  String get deliveryCancelEventTypeTitle => 'Delivery Canceled';

  @override
  String get paymentMethod => 'Payment Method';

  @override
  String get historyPaymentTotal => 'Total:';

  @override
  String get historyDeliveryDetailsOrigin => 'Origin';

  @override
  String get historyDeliveryDetailsDate => 'Date';

  @override
  String get historyDeliveryDetailsDestination => 'Destination';

  @override
  String get historyDeliveryDetailsCourier => 'Courier';

  @override
  String get historyStateErrorEmpty => 'Empty result';

  @override
  String get historyStateErrorNetwork => 'Network issues';

  @override
  String get historyStateErrorRemote => 'Service is unstable';
}
