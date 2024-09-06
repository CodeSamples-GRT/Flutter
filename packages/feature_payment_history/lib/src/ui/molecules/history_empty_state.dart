import 'package:app_common/widgets.dart';
import 'package:flutter/material.dart';

class HistoryEmptyState extends StatelessWidget {
  const HistoryEmptyState({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: EmptyListAtom(
                      text: text,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
}
