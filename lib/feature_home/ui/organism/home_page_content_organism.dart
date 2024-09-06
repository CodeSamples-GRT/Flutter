import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:localization/l10n/localizable_strings.dart';

import '../../../feature_router/router.dart';

class HomePageContentOrganism extends StatelessWidget {
  const HomePageContentOrganism({super.key});

  @override
  Widget build(BuildContext context) => Column(children: [
        ElevatedButton(
          child: Text(AppLocalizations.of(context).paymentHistoryTitle),
          onPressed: () => {context.go(AppRouterPaths.go.paymentHistory)},
        ),
        ElevatedButton(
          child: const Text('Placeholder'),
          onPressed: () => {
            Fluttertoast.showToast(msg: 'Not implemented'),
          },
        ),
      ]);
}
