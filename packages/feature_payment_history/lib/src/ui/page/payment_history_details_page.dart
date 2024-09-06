import 'package:app_common/consts.dart';
import 'package:app_common/theme.dart';
import 'package:app_common/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/l10n/localizable_strings.dart';

import '../../bloc/payment_details_cubit.dart';
import '../../bloc/payment_history_cubit.dart';
import '../../model/payment_history_entity.dart';
import '../../router/payment_history_router.dart';
import '../molecules/history_delivery_details_molecule.dart';
import '../molecules/history_payment_details.dart';
import '../molecules/more_action_item.dart';

class PaymentHistoryDetailsPage extends StatefulWidget {
  const PaymentHistoryDetailsPage({
    required this.history,
    required this.itemIndexRow,
    required this.router,
    required this.showCourierInfo,
    super.key,
  });

  final PaymentHistoryRouter router;
  final PaymentHistoryEntity history;
  final bool? showCourierInfo;
  final int itemIndexRow;

  @override
  State<PaymentHistoryDetailsPage> createState() =>
      _PaymentHistoryDetailsPageState();
}

class _PaymentHistoryDetailsPageState extends State<PaymentHistoryDetailsPage> {
  static const _cardPadding = EdgeInsets.symmetric(
    vertical: AppDimensions.padding16,
    horizontal: AppDimensions.padding24,
  );

  @override
  void initState() {
    super.initState();
    _fetchDeliveryDetails(context);
  }

  @override
  Widget build(BuildContext context) => CenteredPageScaffold(
        title: AppLocalizations.of(context).paymentHistoryDetailsTitle,
        child: BlocBuilder<PaymentDetailsCubit, PaymentDetailsState>(
          builder: (context, state) => state.when(
            initial: () => const CircularProgressIndicator(),
            loading: () => const CircularProgressIndicator(),
            success: (paymentDetails) => _buildContent(
              paymentDetails,
              context,
            ),
            failure: (error) => InlineErrorWidget(
              errorMessage: error.message(
                AppLocalizations.of(context),
              ),
            ),
          ),
        ),
      );

  Widget _buildContent(
    PaymentHistoryDeliveryDetails paymentDetails,
    BuildContext context,
  ) =>
      ListView(
        padding: const EdgeInsets.only(top: AppDimensions.padding16),
        children: [
          CardContainerAtom(
            padding: _cardPadding,
            child: HistoryDeliveryDetailsMolecule(
              pickupTs: paymentDetails.pickupTs,
              pickupAddress: paymentDetails.pickupAddress,
              dropoffAddress: paymentDetails.dropoffAddress,
              driverName: paymentDetails.driverName,
              showCourierInfo: widget.showCourierInfo,
            ),
          ),
          const SizedBox(height: AppDimensions.padding16),
          if (widget.history.showPaymentDetails) ...[
            if (widget.history.paymentMethodType != null)
              CardContainerAtom(
                padding: _cardPadding,
                child: DeliveryPaymentDetails(
                  cardFourDigits: widget.history.cardFourDigits,
                  deliveryCostString: widget.history.deliveryCostString,
                  paymentMethodType: widget.history.paymentMethodType!,
                  paymentMethodName: widget.history.paymentMethodName,
                ),
              ),
            const SizedBox(height: AppDimensions.padding16),
          ],
          CardContainerAtom(
            child: MoreActionItem(
              actionName:
                  AppLocalizations.of(context).paymentHistoryDetailsContactUs,
              padding: _cardPadding,
              textColor: AppColors.labelPrimary,
              iconColor: AppColors.labelPrimary,
              onTap: () {
                widget.router.onPaymentHistoryItemContactUsSelected();
              },
            ),
          ),
        ],
      );

  void _fetchDeliveryDetails(BuildContext context) =>
      PaymentDetailsCubit.of(context)
          .getPaymentDetails(widget.history.deliveryId ?? -1);
}
