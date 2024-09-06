import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:rxdart/rxdart.dart';

class LocaleProvider {
  LocaleProvider(this._supportedLocales) {
    _getLocale();

    PlatformDispatcher.instance.onLocaleChanged = _getLocale;
  }

  final localeStream = BehaviorSubject<Locale>();

  final List<Locale> _supportedLocales;

  Locale get locale => localeStream.value;

  void _getLocale() {
    final windowLocale = PlatformDispatcher.instance.locale;
    localeStream.add(
      _isSupported(windowLocale)
          ? windowLocale
          : _supportedLocales.first,
    );
  }

  bool _isSupported(Locale windowLocale) =>
      _supportedLocales.firstWhereOrNull(
        (element) => windowLocale.languageCode == element.languageCode,
      ) !=
      null;

  void close() {
    localeStream.close();
    PlatformDispatcher.instance.onLocaleChanged = null;
  }
}
