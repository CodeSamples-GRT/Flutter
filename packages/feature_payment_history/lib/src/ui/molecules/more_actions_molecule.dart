import 'package:app_common/consts.dart';

import 'package:flutter/material.dart';

import '../atoms/section_title_atom.dart';
import 'more_action_item.dart';

class MoreActionsMolecule extends StatelessWidget {
  const MoreActionsMolecule({
    required this.items,
    this.title,
    this.padding = EdgeInsets.zero,
    super.key,
  });

  final List<MoreActionItem> items;
  final String? title;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (title != null)
            Semantics(
              container: true,
              child: Padding(
                padding: padding,
                child: SectionTitleAtom(
                  title: title!,
                ),
              ),
            ),
          const SizedBox(height: AppDimensions.padding24),
          ...items,
        ],
      );
}
