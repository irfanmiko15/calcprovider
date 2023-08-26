// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get locale_str {
    return Intl.message(
      'English',
      name: 'locale_str',
      desc: '',
      args: [],
    );
  }

  /// `en`
  String get locale_code {
    return Intl.message(
      'en',
      name: 'locale_code',
      desc: '',
      args: [],
    );
  }

  /// `dd MMMM yyyy`
  String get locale_date_format {
    return Intl.message(
      'dd MMMM yyyy',
      name: 'locale_date_format',
      desc: '',
      args: [],
    );
  }

  /// `Gringgo`
  String get app_name {
    return Intl.message(
      'Gringgo',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `App Support`
  String get email_subject {
    return Intl.message(
      'App Support',
      name: 'email_subject',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get email_body {
    return Intl.message(
      '',
      name: 'email_body',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Open {what} ?`
  String open_what(Object what) {
    return Intl.message(
      'Open $what ?',
      name: 'open_what',
      desc: '',
      args: [what],
    );
  }

  /// `{what} is not available in your phone.`
  String what_not_available_in_your_phone(Object what) {
    return Intl.message(
      '$what is not available in your phone.',
      name: 'what_not_available_in_your_phone',
      desc: '',
      args: [what],
    );
  }

  /// `WhatsApp`
  String get whatsapp {
    return Intl.message(
      'WhatsApp',
      name: 'whatsapp',
      desc: '',
      args: [],
    );
  }

  /// `Saved`
  String get saved {
    return Intl.message(
      'Saved',
      name: 'saved',
      desc: '',
      args: [],
    );
  }

  /// `Save to phone`
  String get save_to_phone {
    return Intl.message(
      'Save to phone',
      name: 'save_to_phone',
      desc: '',
      args: [],
    );
  }

  /// `Not found.`
  String get not_found {
    return Intl.message(
      'Not found.',
      name: 'not_found',
      desc: '',
      args: [],
    );
  }

  /// `No connection error`
  String get no_connection_error {
    return Intl.message(
      'No connection error',
      name: 'no_connection_error',
      desc: '',
      args: [],
    );
  }

  /// `Please check your connection`
  String get please_check_your_connection {
    return Intl.message(
      'Please check your connection',
      name: 'please_check_your_connection',
      desc: '',
      args: [],
    );
  }

  /// `Try Again`
  String get try_again {
    return Intl.message(
      'Try Again',
      name: 'try_again',
      desc: '',
      args: [],
    );
  }

  /// `Exit`
  String get exit {
    return Intl.message(
      'Exit',
      name: 'exit',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get new_password {
    return Intl.message(
      'New Password',
      name: 'new_password',
      desc: '',
      args: [],
    );
  }

  /// `New password required`
  String get new_password_required {
    return Intl.message(
      'New password required',
      name: 'new_password_required',
      desc: '',
      args: [],
    );
  }

  /// `New Password must be between 6-30 characters`
  String get new_password_must_be {
    return Intl.message(
      'New Password must be between 6-30 characters',
      name: 'new_password_must_be',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Password required`
  String get password_required {
    return Intl.message(
      'Password required',
      name: 'password_required',
      desc: '',
      args: [],
    );
  }

  /// `Password must be between 6-30 characters`
  String get password_must_be {
    return Intl.message(
      'Password must be between 6-30 characters',
      name: 'password_must_be',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Confirm New Password`
  String get confirm_new_password {
    return Intl.message(
      'Confirm New Password',
      name: 'confirm_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm new password required`
  String get confirm_new_password_required {
    return Intl.message(
      'Confirm new password required',
      name: 'confirm_new_password_required',
      desc: '',
      args: [],
    );
  }

  /// `Confirm new password must be between 6-30 characters`
  String get confirm_new_password_must_be {
    return Intl.message(
      'Confirm new password must be between 6-30 characters',
      name: 'confirm_new_password_must_be',
      desc: '',
      args: [],
    );
  }

  /// `Confirm new password must be same with new password`
  String get confirm_new_password_must_be_same_with_new_password {
    return Intl.message(
      'Confirm new password must be same with new password',
      name: 'confirm_new_password_must_be_same_with_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Phone required`
  String get phone_required {
    return Intl.message(
      'Phone required',
      name: 'phone_required',
      desc: '',
      args: [],
    );
  }

  /// `Phone length must be between 5-15 digits`
  String get phone_length_must_be {
    return Intl.message(
      'Phone length must be between 5-15 digits',
      name: 'phone_length_must_be',
      desc: '',
      args: [],
    );
  }

  /// `Email required`
  String get email_required {
    return Intl.message(
      'Email required',
      name: 'email_required',
      desc: '',
      args: [],
    );
  }

  /// `Email too short`
  String get email_too_short {
    return Intl.message(
      'Email too short',
      name: 'email_too_short',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get sign_up {
    return Intl.message(
      'Sign Up',
      name: 'sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to exit ?`
  String get do_you_want_to_exit {
    return Intl.message(
      'Do you want to exit ?',
      name: 'do_you_want_to_exit',
      desc: '',
      args: [],
    );
  }

  /// `Logo Upload`
  String get logo_upload {
    return Intl.message(
      'Logo Upload',
      name: 'logo_upload',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Image successfully changed.`
  String get image_success_changed {
    return Intl.message(
      'Image successfully changed.',
      name: 'image_success_changed',
      desc: '',
      args: [],
    );
  }

  /// `Take picture from`
  String get take_pict_from {
    return Intl.message(
      'Take picture from',
      name: 'take_pict_from',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get other_str {
    return Intl.message(
      'Other',
      name: 'other_str',
      desc: '',
      args: [],
    );
  }

  /// `Delete Picture`
  String get delete_pict {
    return Intl.message(
      'Delete Picture',
      name: 'delete_pict',
      desc: '',
      args: [],
    );
  }

  /// `Image error`
  String get image_error {
    return Intl.message(
      'Image error',
      name: 'image_error',
      desc: '',
      args: [],
    );
  }

  /// `This action is not reversible. Continue?`
  String get action_not_reversible_msg {
    return Intl.message(
      'This action is not reversible. Continue?',
      name: 'action_not_reversible_msg',
      desc: '',
      args: [],
    );
  }

  /// `Upload error.`
  String get upload_error {
    return Intl.message(
      'Upload error.',
      name: 'upload_error',
      desc: '',
      args: [],
    );
  }

  /// `Unknown error.`
  String get unknown_error {
    return Intl.message(
      'Unknown error.',
      name: 'unknown_error',
      desc: '',
      args: [],
    );
  }

  /// `Image removed.`
  String get image_removed {
    return Intl.message(
      'Image removed.',
      name: 'image_removed',
      desc: '',
      args: [],
    );
  }

  /// `Sign Out`
  String get sign_out {
    return Intl.message(
      'Sign Out',
      name: 'sign_out',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure?`
  String get are_you_sure {
    return Intl.message(
      'Are you sure?',
      name: 'are_you_sure',
      desc: '',
      args: [],
    );
  }

  /// `Detail`
  String get detail {
    return Intl.message(
      'Detail',
      name: 'detail',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `{what} required`
  String w_required(Object what) {
    return Intl.message(
      '$what required',
      name: 'w_required',
      desc: '',
      args: [what],
    );
  }

  /// `Add {what}`
  String w_add(Object what) {
    return Intl.message(
      'Add $what',
      name: 'w_add',
      desc: '',
      args: [what],
    );
  }

  /// `Edit {what}`
  String w_edit(Object what) {
    return Intl.message(
      'Edit $what',
      name: 'w_edit',
      desc: '',
      args: [what],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `'{what}' will be deleted. Are you sure?`
  String w_will_be_deleted(Object what) {
    return Intl.message(
      '\'$what\' will be deleted. Are you sure?',
      name: 'w_will_be_deleted',
      desc: '',
      args: [what],
    );
  }

  /// `Direktur`
  String get direktur {
    return Intl.message(
      'Direktur',
      name: 'direktur',
      desc: '',
      args: [],
    );
  }

  /// `Latitude`
  String get latitude {
    return Intl.message(
      'Latitude',
      name: 'latitude',
      desc: '',
      args: [],
    );
  }

  /// `Longitude`
  String get longitude {
    return Intl.message(
      'Longitude',
      name: 'longitude',
      desc: '',
      args: [],
    );
  }

  /// `{what} Detail`
  String w_detail(Object what) {
    return Intl.message(
      '$what Detail',
      name: 'w_detail',
      desc: '',
      args: [what],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
