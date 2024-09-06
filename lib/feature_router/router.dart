import 'package:feature_payment_history/feature_payment_history.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../feature_home/ui/home_page.dart';
import '../sl/sl.dart';
import 'navigation_router.dart';

final navigatorKey = GlobalKey<NavigatorState>();
const _appRouterPaths = _AppRouterPathsGo();

final router = GoRouter(
  navigatorKey: navigatorKey,
  routes: <RouteBase>[
    GoRoute(
      path: _AppRouterPathsGo.baseBath,
      builder: (context, state) => const HomePage(),
      routes: <RouteBase>[
        GoRoute(
          path: _appRouterPaths.paymentHistory,
          builder: (context, state) => PaymentHistoryPage(
            di: PaymentHistoryModule(context.read<AppRouter>(), sl()),
          ),
        ),
      ],
    ),
  ],
);

abstract class AppRouterPaths {
  static const go = _AppRouterPathsGo(_AppRouterPathsGo.baseBath);
}

class _AppRouterPathsGo {
  const _AppRouterPathsGo([this._basePath = '']);

  static const baseBath = '/';

  final String _basePath;

  String get paymentHistory => '${_basePath}paymentHistory';
}
