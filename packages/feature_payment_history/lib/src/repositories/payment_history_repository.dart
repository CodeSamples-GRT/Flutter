import 'package:network/network.dart';

class PaymentHistoryRepository {
  const PaymentHistoryRepository(this._network);

  final GeneralService _network;

  Future<PaymentHistoryResponse> getPaymentHistory() =>
      _network.getPaymentHistory();

  Future<PaymentHistoryDetailsResponse> getPaymentHistoryDetails({
    required int deliveryId,
  }) =>
      _network.getPaymentHistoryDetails(
        PaymentHistoryDetailsRequest(deliveryId: deliveryId),
      );
}
