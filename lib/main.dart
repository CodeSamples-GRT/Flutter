import 'package:app_common/data.dart';
import 'package:flutter/material.dart';
import 'package:localization/l10n/localizable_strings.dart';
import 'package:provider/provider.dart';

import 'app_config.dart';
import 'feature_router/navigation_router.dart';
import 'feature_router/router.dart';
import 'sl/sl.dart';

void main() {
  init(AppConfig());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          Provider(create: (_) => LocaleProvider([const Locale('en')])),
          Provider(create: (_) => AppRouter(navigatorKey)),
        ],
        child: Builder(
          builder: (context) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              DateFormats.init(context.read<LocaleProvider>().locale);
            });
            return MaterialApp.router(
              routerConfig: router,
              title: 'Flutter Examples',
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
            );
          },
        ),
      );
}
