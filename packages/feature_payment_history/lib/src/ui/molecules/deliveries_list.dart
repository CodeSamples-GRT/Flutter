import 'package:flutter/material.dart';

import '../atoms/deliveries_day_header_atom.dart';

class DeliveriesList<T> extends StatelessWidget {
  const DeliveriesList({
    required this.deliveries,
    required this.deliveryCardBuilder,
    required this.getHeaderDate,
    super.key,
  });

  final List<T> deliveries;
  final Widget Function(
    BuildContext context,
    int index,
    T deliveryItem, {
    required bool isSingle,
  }) deliveryCardBuilder;
  final DateTime? Function(T? deliveryItem) getHeaderDate;

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemCount: deliveries.length,
        itemBuilder: (context, index) {
          final deliveryItem = deliveries[index];
          final prevDeliveryItem = (index - 1) >= 0 ? deliveries[index - 1] : null;
          final shouldShowDateResult = getHeaderDate(deliveryItem)?.day !=
              getHeaderDate(prevDeliveryItem)?.day;
          final headerDate = getHeaderDate(deliveryItem);
          if (shouldShowDateResult && headerDate != null) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DeliveriesDayHeaderAtom(
                  dateTime: headerDate,
                ),
                deliveryCardBuilder(
                  context,
                  index,
                  deliveryItem,
                  isSingle: deliveries.length <= 1,
                ),
              ],
            );
          }
          return deliveryCardBuilder(
            context,
            index,
            deliveryItem,
            isSingle: deliveries.length <= 1,
          );
        },
      );
}
