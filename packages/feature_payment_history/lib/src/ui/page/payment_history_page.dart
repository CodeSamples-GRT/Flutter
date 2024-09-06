import 'package:app_common/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/l10n/localizable_strings.dart';

import '../../bloc/payment_history_cubit.dart';
import '../../di/payment_history_module.dart';
import '../../model/payment_history_entity.dart';
import '../../router/payment_history_router.dart';
import '../../utils/deliveries_text_formatter.dart';
import '../atoms/history_delivery_status_atom.dart';
import '../molecules/deliveries_list.dart';
import '../molecules/delivery_card_molecule.dart';
import '../molecules/history_empty_state.dart';

class PaymentHistoryPage extends StatelessWidget {
  const PaymentHistoryPage({
    required this.di,
    super.key,
  });

  final PaymentHistoryModule di;

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => PaymentHistoryCubit(
          di.paymentHistoryRepository,
          di.paymentHistoryMapper,
        ),
        child: _PaymentHistoryPage(router: di.paymentHistoryRouter),
      );
}

class _PaymentHistoryPage extends StatefulWidget {
  const _PaymentHistoryPage({
    required this.router,
  });

  final PaymentHistoryRouter router;

  @override
  _PaymentHistoryPageState createState() => _PaymentHistoryPageState();
}

class _PaymentHistoryPageState extends State<_PaymentHistoryPage> {
  @override
  void initState() {
    super.initState();
    _getDeliveryHistory(context);
  }

  void _getDeliveryHistory(BuildContext context) =>
      context.read<PaymentHistoryCubit>().getPaymentHistory();

  @override
  Widget build(BuildContext context) => CenteredPageScaffold(
        title: AppLocalizations.of(context).paymentHistoryTitle,
        child: BlocBuilder<PaymentHistoryCubit, PaymentHistoryState>(
          builder: (_, historyState) => historyState.when(
            initial: () => const CircularProgressIndicator(),
            loading: () => const CircularProgressIndicator(),
            success: (data) => DeliveriesList<PaymentHistoryEntity>(
              deliveries: data,
              deliveryCardBuilder: _buildDeliveryCard,
              getHeaderDate: (deliveryEntity) => deliveryEntity?.eventDateTime,
            ),
            failure: (error) => error == PaymentHistoryErrorType.empty
                ? HistoryEmptyState(
                    text: error.message(
                      AppLocalizations.of(context),
                    ),
                  )
                : InlineErrorWidget(
                    errorMessage: error.message(
                      AppLocalizations.of(context),
                    ),
                  ),
          ),
        ),
      );

  Widget _buildDeliveryCard(
    BuildContext context,
    int index,
    PaymentHistoryEntity historyItem, {
    required bool isSingle,
  }) =>
      DeliveryCardMolecule(
        deliveryStatusWidget: HistoryDeliveryStatusAtom(
          status: historyItem.eventType,
        ),
        deliveryCostString: historyItem.deliveryCostString,
        departAt: DeliveriesTextFormatter.formatHistoryDepartAtLongForm(
          historyItem,
          AppLocalizations.of(context),
        ),
        pickupAddress: historyItem.deliveryDetails?.pickupAddress,
        dropoffAddress: historyItem.deliveryDetails?.dropoffAddress,
        onTap: () {
          if (historyItem.deliveryDetails == null) {
            return;
          }
          widget.router.showPaymentHistoryItemDetails(
            historyItem,
          );
        },
      );
}
