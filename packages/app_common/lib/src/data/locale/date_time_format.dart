import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateFormats {
  DateFormats._();

  static void init(Locale locale) {
    _use12HourFormat = _use12hClock(locale);
    _locale = locale.toLanguageTag();
  }

  static late bool _use12HourFormat;
  static late String _locale;

  static DateFormat get timeFormat =>
      _use12HourFormat ? _timeFormat12h : _timeFormat24h;
  static final DateFormat _timeFormat12h = DateFormat('hh:mm aa', _locale);
  static final DateFormat _timeFormat24h = DateFormat('HH:mm', _locale);
  static final DateFormat dateFormat = DateFormat.yMd(_locale);
  static final dateFormatLongMonth = DateFormat.yMMMd(_locale);
  static final DateFormat dayAndDate = DateFormat.MEd(_locale);

  static final DateFormat dateAndTimeFormat =
      DateFormat('MMM d, ${timeFormat.pattern}', _locale);

  static final longDateTime =
      DateFormat.yMMMd(_locale).addPattern(timeFormat.pattern);
  static final longDayDateTime =
      DateFormat('E MMM d, ${timeFormat.pattern}', _locale);

  static final dayDateTime = DateFormat.E(_locale).add_MMMd().add_y();

  static final dayShort = DateFormat.E(_locale);

  static final dayLong = DateFormat.EEEE(_locale);

  static const _twelveHourLocales = [
    Locale('ar', 'EG'),
    Locale('ar', 'SA'),
    Locale('en', 'AU'),
    Locale('en', 'CA'),
    Locale('en', 'IE'),
    Locale('en', 'NZ'),
    Locale('en', 'US'),
    Locale('en', 'ZA'),
    Locale('es', 'MX'),
    Locale('hi'),
  ];

  static bool _use12hClock(Locale locale) =>
      _twelveHourLocales.contains(locale);
}
