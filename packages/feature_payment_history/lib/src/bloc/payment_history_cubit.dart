import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:localization/l10n/localizable_strings.dart';

import '../mapper/payment_history_mapper.dart';
import '../model/payment_history_entity.dart';
import '../repositories/payment_history_repository.dart';

part 'payment_history_cubit.freezed.dart';

// TODO(paul): generalize usage of the fetch cubits/blocs
class PaymentHistoryCubit extends Cubit<PaymentHistoryState> {
  PaymentHistoryCubit(
    this._paymentHistoryRepository,
    this._paymentHistoryMapper,
  ) : super(const PaymentHistoryState.initial());

  final PaymentHistoryMapper _paymentHistoryMapper;
  final PaymentHistoryRepository _paymentHistoryRepository;

  Future<void> getPaymentHistory() async {
    try {
      emit(const PaymentHistoryState.loading());

      final paymentHistory =
          await _paymentHistoryRepository.getPaymentHistory();
      if (isClosed) {
        return;
      }

      final deliveriesHistoryEntities = _paymentHistoryMapper.mapPaymentHistory(
        paymentHistory,
      );

      emit(
        deliveriesHistoryEntities.isEmpty
            ? const PaymentHistoryState.failure(
                PaymentHistoryErrorType.empty,
              )
            : PaymentHistoryState.success(deliveriesHistoryEntities),
      );
    } catch (error) {
      if (isClosed) {
        return;
      }
      emit(
        PaymentHistoryState.failure(
          error is SocketException
              ? PaymentHistoryErrorType.connectivity
              : PaymentHistoryErrorType.remote,
        ),
      );
    }
  }
}

@freezed
class PaymentHistoryState with _$PaymentHistoryState {
  const PaymentHistoryState._();

  const factory PaymentHistoryState.initial() = _PaymentHistoryStateIntial;

  const factory PaymentHistoryState.loading() = _PaymentHistoryStateLoading;

  const factory PaymentHistoryState.success(
    List<PaymentHistoryEntity> paymentHistory,
  ) = _PaymentHistoryStateSuccess;

  const factory PaymentHistoryState.failure(PaymentHistoryErrorType? error) =
      _PaymentHistoryStateFailure;
}

enum PaymentHistoryErrorType { empty, connectivity, remote }

extension ErrorText on PaymentHistoryErrorType? {
  String message(AppLocalizations localizations) => switch (this) {
        PaymentHistoryErrorType.empty => localizations.historyStateErrorEmpty,
        PaymentHistoryErrorType.connectivity =>
          localizations.historyStateErrorNetwork,
        PaymentHistoryErrorType.remote => localizations.historyStateErrorRemote,
        null => 'Unexpected dev error'
      };
}
