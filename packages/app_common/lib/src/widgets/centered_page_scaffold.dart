import 'package:flutter/material.dart';

import '../../consts.dart';
import '../theme/colors.dart';
import '../theme/text_styles.dart';

const bigScreenCardWidth = 648.0;
const _bigScreenAppBarWidth =
    bigScreenCardWidth + (2 * AppDimensions.padding16);

class CenteredPageScaffold extends StatefulWidget {
  const CenteredPageScaffold({
    required this.child,
    this.title,
    this.subtitle,
    this.onPopped,
    this.actions,
    this.resizeToAvoidBottomInset = false,
    this.cardWidth,
    super.key,
  });

  final String? title;
  final String? subtitle;
  final Widget child;
  final VoidCallback? onPopped;
  final List<Widget>? actions;
  final bool resizeToAvoidBottomInset;
  final double? cardWidth;

  @override
  State<CenteredPageScaffold> createState() => _CenteredPageScaffoldState();
}

class _CenteredPageScaffoldState extends State<CenteredPageScaffold> {
  static const _titleMargin = AppDimensions.padding24;

  @override
  void dispose() {
    widget.onPopped?.call();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_shouldShowAppBar(context))
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: widget.cardWidth ?? _bigScreenAppBarWidth,
                  ),
                  child: AppBar(
                    elevation: 0,
                    scrolledUnderElevation: 0,
                    backgroundColor: AppColors.backgroundSecondary,
                    actions: widget.actions,
                    iconTheme: const IconThemeData(
                      color: AppColors.labelPrimary,
                    ),
                  ),
                )
              else
                const SizedBox(height: AppDimensions.padding40),
              Expanded(
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: AppDimensions.padding16,
                    ),
                    constraints: BoxConstraints(
                      maxWidth: widget.cardWidth ?? bigScreenCardWidth,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (widget.title != null)
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: _titleMargin),
                            child: _buildTitleSubtitle(),
                          ),
                        Expanded(child: widget.child),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
      );

  Widget _buildTitleSubtitle() {
    if (widget.subtitle != null) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(),
          const SizedBox(height: AppDimensions.padding4),
          _buildSubtitle(),
        ],
      );
    }
    return _buildTitle();
  }

  Widget _buildTitle() => Semantics(
        header: true,
        child: Text(
          widget.title!,
          style: TextStyles.largeTitle.copyWith(
            color: AppColors.labelPrimary,
          ),
        ),
      );

  Widget _buildSubtitle() => Text(
        widget.subtitle!,
        style: TextStyles.bodyRegular.copyWith(
          color: AppColors.labelPrimary,
        ),
      );

  static bool _shouldShowAppBar(BuildContext context) =>
      Scaffold.maybeOf(context) == null;
}
