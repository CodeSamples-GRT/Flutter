import 'dart:io';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../mapper/payment_history_mapper.dart';
import '../model/payment_history_entity.dart';
import '../repositories/payment_history_repository.dart';
import 'payment_history_cubit.dart';

part 'payment_details_cubit.freezed.dart';

class PaymentDetailsCubit extends Cubit<PaymentDetailsState> {
  PaymentDetailsCubit(
    this._paymentHistoryRepository,
    this._paymentHistoryMapper,
  ) : super(const PaymentDetailsState.initial());

  static PaymentDetailsCubit of(BuildContext context) =>
      BlocProvider.of(context);

  final PaymentHistoryMapper _paymentHistoryMapper;
  final PaymentHistoryRepository _paymentHistoryRepository;

  Future<void> getPaymentDetails(int deliveryId) async {
    try {
      emit(const PaymentDetailsState.loading());

      final result = await _paymentHistoryRepository.getPaymentHistoryDetails(
        deliveryId: deliveryId,
      );
      if (isClosed) {
        return;
      }

      final paymentDetails =
          _paymentHistoryMapper.mapPaymentDetails(result.purchaseDetails);

      emit(
        paymentDetails == null
            ? const PaymentDetailsState.failure(
                PaymentHistoryErrorType.empty,
              )
            : PaymentDetailsState.success(paymentDetails),
      );
    } catch (error) {
      if (isClosed) {
        return;
      }
      emit(
        PaymentDetailsState.failure(
          error is SocketException
              ? PaymentHistoryErrorType.connectivity
              : PaymentHistoryErrorType.remote,
        ),
      );
    }
  }
}

@freezed
class PaymentDetailsState with _$PaymentDetailsState {
  const PaymentDetailsState._();

  const factory PaymentDetailsState.initial() = _PaymentDetailsStateIntial;

  const factory PaymentDetailsState.loading() = _PaymentDetailsStateLoading;

  const factory PaymentDetailsState.success(
    PaymentHistoryDeliveryDetails paymentDetails,
  ) = _PaymentDetailsStateSuccess;

  const factory PaymentDetailsState.failure(PaymentHistoryErrorType? error) =
      _PaymentDetailsStateFailure;
}
