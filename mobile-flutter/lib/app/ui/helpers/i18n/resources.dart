import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import './strings/strings.dart';

class R {
  static late Translation string;

  static Future<void> load([String? localeString]) async {
    try {
      if (localeString == null) {
        localeString = 'pt_BR';
        if (kIsWeb) {
        } else {
          localeString = Platform.localeName;
        }
      }
      final localeArray = localeString.split('_');
      late String languageCode;
      late String contryCode;

      if (localeArray.length == 2) {
        languageCode = localeArray[0];
        contryCode = localeArray[1];
      } else {
        languageCode = 'pt';
        contryCode = 'BR';
      }

      final locale = Locale(languageCode, contryCode);
      switch (locale.languageCode.toLowerCase()) {
        case 'en':
          string = EnUs();
          break;
        case 'pt':
          string = PtBr();
          break;
        default:
          string = PtBr();
          break;
      }
    } catch (e) {
      string = PtBr();
    }
  }
}
