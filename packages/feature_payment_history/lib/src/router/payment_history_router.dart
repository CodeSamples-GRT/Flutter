import '../model/payment_history_entity.dart';

mixin PaymentHistoryRouter {
  void showPaymentHistoryItemDetails(PaymentHistoryEntity historyItem);

  void onPaymentHistoryItemContactUsSelected();
}
