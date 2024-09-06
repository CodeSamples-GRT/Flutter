import 'package:feature_payment_history/feature_payment_history.dart';
import 'package:flutter/widgets.dart';

class AppRouter with PaymentHistoryRouter {
  const AppRouter(this.navigatorKey);

  final GlobalKey<NavigatorState> navigatorKey;

  BuildContext? get _context => navigatorKey.currentContext;

  @override
  void onPaymentHistoryItemContactUsSelected() {}

  @override
  void showPaymentHistoryItemDetails(PaymentHistoryEntity historyItem) {}
}
