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

  /// `Terms and Conditions`
  String get termsAndConditions {
    return Intl.message(
      'Terms and Conditions',
      name: 'termsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `I agree to the `
  String get iAgreeToThe {
    return Intl.message(
      'I agree to the ',
      name: 'iAgreeToThe',
      desc: '',
      args: [],
    );
  }

  /// `I Accept and Continue`
  String get iAcceptAndContinue {
    return Intl.message(
      'I Accept and Continue',
      name: 'iAcceptAndContinue',
      desc: '',
      args: [],
    );
  }

  /// `I have read and agree to the Terms and Conditions.`
  String get iHaveReadAndAgreeToTheTermsAndConditions {
    return Intl.message(
      'I have read and agree to the Terms and Conditions.',
      name: 'iHaveReadAndAgreeToTheTermsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Conditions must be accepted!`
  String get TermsAndConditionsMustBeAccepted {
    return Intl.message(
      'Terms and Conditions must be accepted!',
      name: 'TermsAndConditionsMustBeAccepted',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Login with Google`
  String get loginWithGoogle {
    return Intl.message(
      'Login with Google',
      name: 'loginWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Enter your name`
  String get enterYourName {
    return Intl.message(
      'Enter your name',
      name: 'enterYourName',
      desc: '',
      args: [],
    );
  }

  /// `Name is required.`
  String get nameIsRequired {
    return Intl.message(
      'Name is required.',
      name: 'nameIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Name must be at least 2 characters long.`
  String get nameTooShort {
    return Intl.message(
      'Name must be at least 2 characters long.',
      name: 'nameTooShort',
      desc: '',
      args: [],
    );
  }

  /// `Name can only contain letters or spaces.`
  String get nameCanOnlyContainLettersOrSpaces {
    return Intl.message(
      'Name can only contain letters or spaces.',
      name: 'nameCanOnlyContainLettersOrSpaces',
      desc: '',
      args: [],
    );
  }

  /// `E-mail`
  String get email {
    return Intl.message('E-mail', name: 'email', desc: '', args: []);
  }

  /// `Enter your email`
  String get enterYourEmail {
    return Intl.message(
      'Enter your email',
      name: 'enterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email to receive a password reset link.`
  String get enterYourEmailToReceiveAPasswordResetLink {
    return Intl.message(
      'Enter your email to receive a password reset link.',
      name: 'enterYourEmailToReceiveAPasswordResetLink',
      desc: '',
      args: [],
    );
  }

  /// `Email is required.`
  String get emailIsRequired {
    return Intl.message(
      'Email is required.',
      name: 'emailIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid email address.`
  String get invalidEmail {
    return Intl.message(
      'Enter a valid email address.',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `This email is already in use.`
  String get thisEmailIsAlreadyInUse {
    return Intl.message(
      'This email is already in use.',
      name: 'thisEmailIsAlreadyInUse',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Enter your password`
  String get enterYourPassword {
    return Intl.message(
      'Enter your password',
      name: 'enterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password is required.`
  String get passwordIsRequired {
    return Intl.message(
      'Password is required.',
      name: 'passwordIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters and include:`
  String get passwordTooShort {
    return Intl.message(
      'Password must be at least 8 characters and include:',
      name: 'passwordTooShort',
      desc: '',
      args: [],
    );
  }

  /// `Uppercase letter`
  String get passwordUppercaseLetter {
    return Intl.message(
      'Uppercase letter',
      name: 'passwordUppercaseLetter',
      desc: '',
      args: [],
    );
  }

  /// `Lowercase letter`
  String get passwordLowercaseLetter {
    return Intl.message(
      'Lowercase letter',
      name: 'passwordLowercaseLetter',
      desc: '',
      args: [],
    );
  }

  /// `Number`
  String get passwordNumber {
    return Intl.message('Number', name: 'passwordNumber', desc: '', args: []);
  }

  /// `Special character`
  String get passwordSpecialCharacter {
    return Intl.message(
      'Special character',
      name: 'passwordSpecialCharacter',
      desc: '',
      args: [],
    );
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

  /// `Confirm your password`
  String get confirmYourPassword {
    return Intl.message(
      'Confirm your password',
      name: 'confirmYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password is required.`
  String get confirmPasswordIsRequired {
    return Intl.message(
      'Confirm password is required.',
      name: 'confirmPasswordIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match.`
  String get passwordsDoNotMatch {
    return Intl.message(
      'Passwords do not match.',
      name: 'passwordsDoNotMatch',
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

  /// `User not found.`
  String get userNotFound {
    return Intl.message(
      'User not found.',
      name: 'userNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email or password.`
  String get invalidEmailOrPassword {
    return Intl.message(
      'Invalid email or password.',
      name: 'invalidEmailOrPassword',
      desc: '',
      args: [],
    );
  }

  /// `The password provided is too weak.`
  String get weakPassword {
    return Intl.message(
      'The password provided is too weak.',
      name: 'weakPassword',
      desc: '',
      args: [],
    );
  }

  /// `There is no internet connection.`
  String get noInternetConnection {
    return Intl.message(
      'There is no internet connection.',
      name: 'noInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Too many requests. Please try again later.`
  String get tooManyRequests {
    return Intl.message(
      'Too many requests. Please try again later.',
      name: 'tooManyRequests',
      desc: '',
      args: [],
    );
  }

  /// `Authentication failed. Please try again later.`
  String get authenticationFailed {
    return Intl.message(
      'Authentication failed. Please try again later.',
      name: 'authenticationFailed',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get or {
    return Intl.message('Or', name: 'or', desc: '', args: []);
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
