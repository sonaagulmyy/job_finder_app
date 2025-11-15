import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
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

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
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
    Locale('en'),
    Locale('ru'),
    Locale('tr')
  ];

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @letsFindYourDreamJob.
  ///
  /// In en, this message translates to:
  /// **'Let\'s find your dream job'**
  String get letsFindYourDreamJob;

  /// No description provided for @recommendations.
  ///
  /// In en, this message translates to:
  /// **'Recommendations'**
  String get recommendations;

  /// No description provided for @recentJob.
  ///
  /// In en, this message translates to:
  /// **'Recent job'**
  String get recentJob;

  /// No description provided for @seeAll.
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get seeAll;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @saved.
  ///
  /// In en, this message translates to:
  /// **'Saved'**
  String get saved;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @noSavedJobs.
  ///
  /// In en, this message translates to:
  /// **'No Saved Jobs'**
  String get noSavedJobs;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @languages.
  ///
  /// In en, this message translates to:
  /// **'Languages'**
  String get languages;

  /// No description provided for @privacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get privacy;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark mode'**
  String get darkMode;

  /// No description provided for @logOut.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get logOut;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @letsJumpIn.
  ///
  /// In en, this message translates to:
  /// **'Let\'s jump in'**
  String get letsJumpIn;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signIn;

  /// No description provided for @dontHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAnAccount;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signUp;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @typeTheCode.
  ///
  /// In en, this message translates to:
  /// **'Type the code'**
  String get typeTheCode;

  /// No description provided for @sentTheCode.
  ///
  /// In en, this message translates to:
  /// **'Sent the code:'**
  String get sentTheCode;

  /// No description provided for @resendTheCode.
  ///
  /// In en, this message translates to:
  /// **'Resend the code'**
  String get resendTheCode;

  /// No description provided for @selectYourRegion.
  ///
  /// In en, this message translates to:
  /// **'Select your region'**
  String get selectYourRegion;

  /// No description provided for @continuee.
  ///
  /// In en, this message translates to:
  /// **'continue'**
  String get continuee;

  /// No description provided for @selectJobType.
  ///
  /// In en, this message translates to:
  /// **'Select job type'**
  String get selectJobType;

  /// No description provided for @chooseYourJobType.
  ///
  /// In en, this message translates to:
  /// **'Choose your job type'**
  String get chooseYourJobType;

  /// No description provided for @chooseJobExplanation.
  ///
  /// In en, this message translates to:
  /// **'Choose whether you are looking for a job or you are company needs employee'**
  String get chooseJobExplanation;

  /// No description provided for @findAjobForYou.
  ///
  /// In en, this message translates to:
  /// **'Find a job for you'**
  String get findAjobForYou;

  /// No description provided for @wannaFindjob.
  ///
  /// In en, this message translates to:
  /// **'I want to find a job for me'**
  String get wannaFindjob;

  /// No description provided for @findAnEmployee.
  ///
  /// In en, this message translates to:
  /// **'Find an employee'**
  String get findAnEmployee;

  /// No description provided for @wannaFindEmployee.
  ///
  /// In en, this message translates to:
  /// **'I want to find an employee'**
  String get wannaFindEmployee;

  /// No description provided for @selectYourExperience.
  ///
  /// In en, this message translates to:
  /// **'Select your experience'**
  String get selectYourExperience;

  /// No description provided for @accountingAndFinance.
  ///
  /// In en, this message translates to:
  /// **'Accounting and Finance'**
  String get accountingAndFinance;

  /// No description provided for @graphicDesign.
  ///
  /// In en, this message translates to:
  /// **'Graphic design'**
  String get graphicDesign;

  /// No description provided for @mediaDesignCreative.
  ///
  /// In en, this message translates to:
  /// **'Media,Design,Creative'**
  String get mediaDesignCreative;

  /// No description provided for @salesAndMarketing.
  ///
  /// In en, this message translates to:
  /// **'Sales and Marketing'**
  String get salesAndMarketing;

  /// No description provided for @programming.
  ///
  /// In en, this message translates to:
  /// **'Programming'**
  String get programming;

  /// No description provided for @writingAndContent.
  ///
  /// In en, this message translates to:
  /// **'Writing and Content'**
  String get writingAndContent;

  /// No description provided for @tailor.
  ///
  /// In en, this message translates to:
  /// **'Tailor'**
  String get tailor;

  /// No description provided for @smmManager.
  ///
  /// In en, this message translates to:
  /// **'SMM manager'**
  String get smmManager;

  /// No description provided for @hairdresser.
  ///
  /// In en, this message translates to:
  /// **'Hairdresser'**
  String get hairdresser;

  /// No description provided for @driver.
  ///
  /// In en, this message translates to:
  /// **'Driver'**
  String get driver;

  /// No description provided for @fillProfile.
  ///
  /// In en, this message translates to:
  /// **'Fill your profile'**
  String get fillProfile;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @surname.
  ///
  /// In en, this message translates to:
  /// **'Surname'**
  String get surname;

  /// No description provided for @birthday.
  ///
  /// In en, this message translates to:
  /// **'Birthday'**
  String get birthday;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @congratulations.
  ///
  /// In en, this message translates to:
  /// **'Congratulations!'**
  String get congratulations;

  /// No description provided for @accountReady.
  ///
  /// In en, this message translates to:
  /// **'Your account is ready to use,you will be redirected to Home page '**
  String get accountReady;

  /// No description provided for @ashgabat.
  ///
  /// In en, this message translates to:
  /// **'Ashgabat'**
  String get ashgabat;

  /// No description provided for @balkan.
  ///
  /// In en, this message translates to:
  /// **'Balkan'**
  String get balkan;

  /// No description provided for @ahal.
  ///
  /// In en, this message translates to:
  /// **'Ahal'**
  String get ahal;

  /// No description provided for @mary.
  ///
  /// In en, this message translates to:
  /// **'Mary'**
  String get mary;

  /// No description provided for @lebap.
  ///
  /// In en, this message translates to:
  /// **'Lebap'**
  String get lebap;

  /// No description provided for @dashoguz.
  ///
  /// In en, this message translates to:
  /// **'Dashoguz'**
  String get dashoguz;

  /// No description provided for @logIn.
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get logIn;

  /// No description provided for @nothingFound.
  ///
  /// In en, this message translates to:
  /// **'Nothing found'**
  String get nothingFound;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @neww.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get neww;

  /// No description provided for @jobHasBeenUpdated.
  ///
  /// In en, this message translates to:
  /// **'Job has been updated'**
  String get jobHasBeenUpdated;

  /// No description provided for @december.
  ///
  /// In en, this message translates to:
  /// **'December'**
  String get december;

  /// No description provided for @found.
  ///
  /// In en, this message translates to:
  /// **'Found'**
  String get found;

  /// No description provided for @jobSaved.
  ///
  /// In en, this message translates to:
  /// **'Job saved!'**
  String get jobSaved;

  /// No description provided for @removedFromSaved.
  ///
  /// In en, this message translates to:
  /// **'Removed from saved!'**
  String get removedFromSaved;

  /// No description provided for @changeLanguage.
  ///
  /// In en, this message translates to:
  /// **'Change language'**
  String get changeLanguage;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ru', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'ru': return AppLocalizationsRu();
    case 'tr': return AppLocalizationsTr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
