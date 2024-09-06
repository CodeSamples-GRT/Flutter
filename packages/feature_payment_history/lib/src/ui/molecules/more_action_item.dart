import 'package:app_common/theme.dart';
import 'package:app_common/widgets.dart';
import 'package:flutter/material.dart';

class MoreActionItem extends StatelessWidget {
  const MoreActionItem({
    required this.actionName,
    required this.onTap,
    this.textColor,
    this.iconColor,
    this.padding = EdgeInsets.zero,
    this.isTextBold = true,
    super.key,
  });

  final String actionName;
  final VoidCallback onTap;
  final Color? textColor;
  final Color? iconColor;
  final EdgeInsets padding;
  final bool isTextBold;

  @override
  Widget build(BuildContext context) => MaterialInkWell(
        onTap: onTap,
        child: Padding(
          padding: padding,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  actionName,
                  style: (isTextBold
                          ? TextStyles.calloutMedium
                          : TextStyles.calloutRegular)
                      .copyWith(
                    color:
                        textColor ?? AppColors.labelPrimary,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
