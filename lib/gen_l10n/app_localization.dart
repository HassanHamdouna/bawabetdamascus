import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localization_ar.dart';
import 'app_localization_en.dart';
import 'app_localization_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localization.dart';
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
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('fr')
  ];

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Bawabet Damascus'**
  String get title;

  /// No description provided for @restaurant_management.
  ///
  /// In en, this message translates to:
  /// **'Manage your restaurant easily'**
  String get restaurant_management;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @time.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get time;

  /// No description provided for @day.
  ///
  /// In en, this message translates to:
  /// **'Day'**
  String get day;

  /// No description provided for @accountant.
  ///
  /// In en, this message translates to:
  /// **'Accountant'**
  String get accountant;

  /// No description provided for @manager.
  ///
  /// In en, this message translates to:
  /// **'Manager'**
  String get manager;

  /// No description provided for @system_managers.
  ///
  /// In en, this message translates to:
  /// **'System Managers'**
  String get system_managers;

  /// No description provided for @owner.
  ///
  /// In en, this message translates to:
  /// **'Owner'**
  String get owner;

  /// No description provided for @stock.
  ///
  /// In en, this message translates to:
  /// **'Stock'**
  String get stock;

  /// No description provided for @waiter.
  ///
  /// In en, this message translates to:
  /// **'Waiter'**
  String get waiter;

  /// No description provided for @kitchen.
  ///
  /// In en, this message translates to:
  /// **'Kitchen'**
  String get kitchen;

  /// No description provided for @change_language.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get change_language;

  /// No description provided for @choose_language.
  ///
  /// In en, this message translates to:
  /// **'Choose suitable Language'**
  String get choose_language;

  /// No description provided for @add_category.
  ///
  /// In en, this message translates to:
  /// **'Add Category'**
  String get add_category;

  /// No description provided for @edit_category.
  ///
  /// In en, this message translates to:
  /// **'Edit Category'**
  String get edit_category;

  /// No description provided for @save_category_changes.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get save_category_changes;

  /// No description provided for @category_name.
  ///
  /// In en, this message translates to:
  /// **'Category Name'**
  String get category_name;

  /// No description provided for @add_item.
  ///
  /// In en, this message translates to:
  /// **'Add Item'**
  String get add_item;

  /// No description provided for @edit_item.
  ///
  /// In en, this message translates to:
  /// **'Edit Item'**
  String get edit_item;

  /// No description provided for @item_name.
  ///
  /// In en, this message translates to:
  /// **'Item Name'**
  String get item_name;

  /// No description provided for @item_description.
  ///
  /// In en, this message translates to:
  /// **'Item Description'**
  String get item_description;

  /// No description provided for @item_number.
  ///
  /// In en, this message translates to:
  /// **'Item Number'**
  String get item_number;

  /// No description provided for @item_price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get item_price;

  /// No description provided for @prep_time.
  ///
  /// In en, this message translates to:
  /// **'Preparation Time (min)'**
  String get prep_time;

  /// No description provided for @choose_category.
  ///
  /// In en, this message translates to:
  /// **'Choose Category'**
  String get choose_category;

  /// No description provided for @available.
  ///
  /// In en, this message translates to:
  /// **'Available'**
  String get available;

  /// No description provided for @item_notes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get item_notes;

  /// No description provided for @save_item_changes.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get save_item_changes;

  /// No description provided for @select_category_warning.
  ///
  /// In en, this message translates to:
  /// **'Please select a category'**
  String get select_category_warning;

  /// No description provided for @error_saving_item.
  ///
  /// In en, this message translates to:
  /// **'Error while saving item'**
  String get error_saving_item;

  /// No description provided for @menu_management.
  ///
  /// In en, this message translates to:
  /// **'Menu Management'**
  String get menu_management;

  /// No description provided for @search_item_hint.
  ///
  /// In en, this message translates to:
  /// **'Search for an item...'**
  String get search_item_hint;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @no_categories.
  ///
  /// In en, this message translates to:
  /// **'No categories'**
  String get no_categories;

  /// No description provided for @no_items.
  ///
  /// In en, this message translates to:
  /// **'No items'**
  String get no_items;

  /// No description provided for @not_available.
  ///
  /// In en, this message translates to:
  /// **'Not Available'**
  String get not_available;

  /// No description provided for @updating_error.
  ///
  /// In en, this message translates to:
  /// **'Error while updating'**
  String get updating_error;

  /// No description provided for @system_manager.
  ///
  /// In en, this message translates to:
  /// **'System Manager'**
  String get system_manager;

  /// No description provided for @manage_employees.
  ///
  /// In en, this message translates to:
  /// **'Manage Employees'**
  String get manage_employees;

  /// No description provided for @manage_menu.
  ///
  /// In en, this message translates to:
  /// **'Manage Menu'**
  String get manage_menu;

  /// No description provided for @add_user.
  ///
  /// In en, this message translates to:
  /// **'Add User'**
  String get add_user;

  /// No description provided for @edit_user.
  ///
  /// In en, this message translates to:
  /// **'Edit User'**
  String get edit_user;

  /// No description provided for @save_changes.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get save_changes;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// No description provided for @nationality.
  ///
  /// In en, this message translates to:
  /// **'Nationality'**
  String get nationality;

  /// No description provided for @birthdate.
  ///
  /// In en, this message translates to:
  /// **'Birthdate'**
  String get birthdate;

  /// No description provided for @salary.
  ///
  /// In en, this message translates to:
  /// **'Salary'**
  String get salary;

  /// No description provided for @contract_type.
  ///
  /// In en, this message translates to:
  /// **'Contract Type'**
  String get contract_type;

  /// No description provided for @start_date.
  ///
  /// In en, this message translates to:
  /// **'Start Date'**
  String get start_date;

  /// No description provided for @end_date.
  ///
  /// In en, this message translates to:
  /// **'End Date'**
  String get end_date;

  /// No description provided for @hours.
  ///
  /// In en, this message translates to:
  /// **'Hours'**
  String get hours;

  /// No description provided for @deductions.
  ///
  /// In en, this message translates to:
  /// **'Deductions'**
  String get deductions;

  /// No description provided for @last_deduction.
  ///
  /// In en, this message translates to:
  /// **'Last Deduction'**
  String get last_deduction;

  /// No description provided for @deduction_reason.
  ///
  /// In en, this message translates to:
  /// **'Deduction Reason'**
  String get deduction_reason;

  /// No description provided for @supplies_received.
  ///
  /// In en, this message translates to:
  /// **'Supplies Received'**
  String get supplies_received;

  /// No description provided for @supplies_delivered.
  ///
  /// In en, this message translates to:
  /// **'Supplies Delivered'**
  String get supplies_delivered;

  /// No description provided for @supplies_date.
  ///
  /// In en, this message translates to:
  /// **'Supplies Date'**
  String get supplies_date;

  /// No description provided for @notes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get notes;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @role.
  ///
  /// In en, this message translates to:
  /// **'Role'**
  String get role;

  /// No description provided for @place.
  ///
  /// In en, this message translates to:
  /// **'Place'**
  String get place;

  /// No description provided for @uses_app.
  ///
  /// In en, this message translates to:
  /// **'Uses App'**
  String get uses_app;

  /// No description provided for @choose_image.
  ///
  /// In en, this message translates to:
  /// **'Choose Image'**
  String get choose_image;

  /// No description provided for @user_management.
  ///
  /// In en, this message translates to:
  /// **'User Management'**
  String get user_management;

  /// No description provided for @search_user_hint.
  ///
  /// In en, this message translates to:
  /// **'Search for a user...'**
  String get search_user_hint;

  /// No description provided for @filter_by_role.
  ///
  /// In en, this message translates to:
  /// **'Filter by role'**
  String get filter_by_role;

  /// No description provided for @no_users.
  ///
  /// In en, this message translates to:
  /// **'No users found'**
  String get no_users;

  /// No description provided for @error_fetching_users.
  ///
  /// In en, this message translates to:
  /// **'Error fetching users'**
  String get error_fetching_users;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
