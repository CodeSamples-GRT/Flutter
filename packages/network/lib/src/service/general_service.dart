import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../request/payment/history/details/payment_history_details_request.dart';
import '../response/payment/history/payment_history_details_response.dart';
import '../response/payment/history/payment_history_response.dart';

part 'general_service.g.dart';

@RestApi()
abstract class GeneralService {
  factory GeneralService(
    Dio dio, {
    required String baseUrl,
  }) = _GeneralService;

  @POST('/payment/history')
  Future<PaymentHistoryResponse> getPaymentHistory();

  @POST('/payment/history/details')
  Future<PaymentHistoryDetailsResponse> getPaymentHistoryDetails(
    @Body() PaymentHistoryDetailsRequest body,
  );
}
