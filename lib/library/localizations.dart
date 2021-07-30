import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:tike_consumer/l10n/messages_all.dart';

class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String get title {
    return Intl.message('Hello world App',
        name: 'title', desc: 'The application title');
  }
  String get button_login_text {
    return Intl.message('validate', name: 'button_login_text');
  }
  String get text_login_text {
    return Intl.message('Register now', name: 'text_login_text');
  }
  String get privacy_login_text {
    return Intl.message('By continuing you agree to our Terms and Conditions of our privacy policy.', name: 'privacy_login_text');
  }
  String get hello {
    return Intl.message('Hello', name: 'hello');
  }

  String get phonenumber_login_label {
    return Intl.message('Your phone number', name: 'phonenumber_login_label');
  }
  String get privacy_policy_label {
    return Intl.message('Privacy Policy', name: 'privacy_policy_label');
  }
  String get privacy_policy_body {
    return Intl.message('Capture Solutions Cote dIvoire attaches great importance to the issue of the management of Personal Data that it processes in the implementation of its activities.' , name: 'privacy_policy_body');
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'fr'/*, 'es', 'pt'*/].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}
