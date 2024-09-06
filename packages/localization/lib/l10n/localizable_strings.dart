import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'localizable_strings_en.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/localizable_strings.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Flutter Examples'**
  String get appName;

  /// No description provided for @paymentHistoryDetailsTitle.
  ///
  /// In en, this message translates to:
  /// **'Payment details'**
  String get paymentHistoryDetailsTitle;

  /// No description provided for @paymentHistoryDetailsContactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact us'**
  String get paymentHistoryDetailsContactUs;

  /// No description provided for @paymentHistoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Payment history'**
  String get paymentHistoryTitle;

  /// No description provided for @paymentHistoryEmpty.
  ///
  /// In en, this message translates to:
  /// **'No result'**
  String get paymentHistoryEmpty;

  /// No description provided for @historyDeliveryStatusCanceled.
  ///
  /// In en, this message translates to:
  /// **'Canceled'**
  String get historyDeliveryStatusCanceled;

  /// No description provided for @historyDeliveryStatusCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get historyDeliveryStatusCompleted;

  /// No description provided for @historyDeliveryStatusNoShowPickup.
  ///
  /// In en, this message translates to:
  /// **'No show during pickup'**
  String get historyDeliveryStatusNoShowPickup;

  /// No description provided for @historyDeliveryStatusNoShowDropoff.
  ///
  /// In en, this message translates to:
  /// **'No show during drop off'**
  String get historyDeliveryStatusNoShowDropoff;

  /// No description provided for @creditPurchaseEventTypeTitle.
  ///
  /// In en, this message translates to:
  /// **'Credit purchase'**
  String get creditPurchaseEventTypeTitle;

  /// No description provided for @creditRefundEventTypeTitle.
  ///
  /// In en, this message translates to:
  /// **'Credit refund'**
  String get creditRefundEventTypeTitle;

  /// No description provided for @refundEventTypeTitle.
  ///
  /// In en, this message translates to:
  /// **'Refund'**
  String get refundEventTypeTitle;

  /// No description provided for @ticketPurchasedEventTypeTitle.
  ///
  /// In en, this message translates to:
  /// **'Tickets Purchased'**
  String get ticketPurchasedEventTypeTitle;

  /// No description provided for @deliveryCancelEventTypeTitle.
  ///
  /// In en, this message translates to:
  /// **'Delivery Canceled'**
  String get deliveryCancelEventTypeTitle;

  /// No description provided for @paymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get paymentMethod;

  /// No description provided for @historyPaymentTotal.
  ///
  /// In en, this message translates to:
  /// **'Total:'**
  String get historyPaymentTotal;

  /// No description provided for @historyDeliveryDetailsOrigin.
  ///
  /// In en, this message translates to:
  /// **'Origin'**
  String get historyDeliveryDetailsOrigin;

  /// No description provided for @historyDeliveryDetailsDate.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get historyDeliveryDetailsDate;

  /// No description provided for @historyDeliveryDetailsDestination.
  ///
  /// In en, this message translates to:
  /// **'Destination'**
  String get historyDeliveryDetailsDestination;

  /// No description provided for @historyDeliveryDetailsCourier.
  ///
  /// In en, this message translates to:
  /// **'Courier'**
  String get historyDeliveryDetailsCourier;

  /// No description provided for @historyStateErrorEmpty.
  ///
  /// In en, this message translates to:
  /// **'Empty result'**
  String get historyStateErrorEmpty;

  /// No description provided for @historyStateErrorNetwork.
  ///
  /// In en, this message translates to:
  /// **'Network issues'**
  String get historyStateErrorNetwork;

  /// No description provided for @historyStateErrorRemote.
  ///
  /// In en, this message translates to:
  /// **'Service is unstable'**
  String get historyStateErrorRemote;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
