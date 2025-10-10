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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Curely`
  String get title {
    return Intl.message('Curely', name: 'title', desc: '', args: []);
  }

  /// `Choose The Language`
  String get chooseLanguage {
    return Intl.message(
      'Choose The Language',
      name: 'chooseLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Select your preferred language below This helps us serve you better.`
  String get chooseLanguageSubTitle {
    return Intl.message(
      'Select your preferred language below This helps us serve you better.',
      name: 'chooseLanguageSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Arabic`
  String get arabic {
    return Intl.message('Arabic', name: 'arabic', desc: '', args: []);
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message('Get Started', name: 'getStarted', desc: '', args: []);
  }

  /// `Welcome`
  String get welcome {
    return Intl.message('Welcome', name: 'welcome', desc: '', args: []);
  }

  /// `to`
  String get to {
    return Intl.message('to', name: 'to', desc: '', args: []);
  }

  /// `Track your medicines`
  String get onBoardingTitle1 {
    return Intl.message(
      'Track your medicines',
      name: 'onBoardingTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Get reminders`
  String get onBoardingTitle2 {
    return Intl.message(
      'Get reminders',
      name: 'onBoardingTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Organize your medicines`
  String get onBoardingTitle3 {
    return Intl.message(
      'Organize your medicines',
      name: 'onBoardingTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Stay healthy`
  String get onBoardingTitle4 {
    return Intl.message(
      'Stay healthy',
      name: 'onBoardingTitle4',
      desc: '',
      args: [],
    );
  }

  /// `Easily manage and track your medications in one place.`
  String get onBoardingSubTitle1 {
    return Intl.message(
      'Easily manage and track your medications in one place.',
      name: 'onBoardingSubTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Never miss a dose with timely reminders and notifications.`
  String get onBoardingSubTitle2 {
    return Intl.message(
      'Never miss a dose with timely reminders and notifications.',
      name: 'onBoardingSubTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Keep your medications organized for easy access and management.`
  String get onBoardingSubTitle3 {
    return Intl.message(
      'Keep your medications organized for easy access and management.',
      name: 'onBoardingSubTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Maintain your health with proper medication management.`
  String get onBoardingSubTitle4 {
    return Intl.message(
      'Maintain your health with proper medication management.',
      name: 'onBoardingSubTitle4',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Send Reset Link`
  String get sendResetLink {
    return Intl.message(
      'Send Reset Link',
      name: 'sendResetLink',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email to receive a password reset link.`
  String get enterYourEmail {
    return Intl.message(
      'Enter your email to receive a password reset link.',
      name: 'enterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
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
