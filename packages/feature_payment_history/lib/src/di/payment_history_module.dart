import 'package:network/network.dart';

import '../mapper/payment_history_mapper.dart';
import '../repositories/payment_history_repository.dart';
import '../router/payment_history_router.dart';

// TODO(paul): create a provider based di injections to move it to const
// with getter methods
class PaymentHistoryModule {
  PaymentHistoryModule(this.paymentHistoryRouter, this._network);

  final GeneralService _network;
  final PaymentHistoryRouter paymentHistoryRouter;

  late final PaymentHistoryRepository paymentHistoryRepository =
      PaymentHistoryRepository(_network);

  final PaymentHistoryMapper paymentHistoryMapper =
      const PaymentHistoryMapper();
}
