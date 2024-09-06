import 'package:app_common/consts.dart';
import 'package:flutter/material.dart';

import '../atoms/price_atom.dart';

class DeliveryCardBottomMolecule extends StatelessWidget {
  const DeliveryCardBottomMolecule({
    required this.deliveryStatusWidget,
    required this.deliveryCostString,
    super.key,
  });

  final String? deliveryCostString;
  final Widget deliveryStatusWidget;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Spacer(),
          Row(
            children: [
              deliveryStatusWidget,
              if (deliveryCostString?.isNotEmpty == true)
                Container(
                  margin: const EdgeInsetsDirectional.only(
                    start: AppDimensions.padding8,
                  ),
                  decoration: const BoxDecoration(
                    border: BorderDirectional(
                      start: BorderSide(
                        width: 2,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                      start: AppDimensions.padding8,
                    ),
                    child: PriceAtom(
                      price: deliveryCostString!,
                    ),
                  ),
                ),
            ],
          ),
        ],
      );
}
