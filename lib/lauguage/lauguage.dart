import 'package:flutter/material.dart';

enum Language { zh, en }

extension LanguageValue on Language {
  Locale get locale {
    switch (this) {
      case Language.zh:
        return const Locale("zh", "TW");
      case Language.en:
        return const Locale("en", "US");
      // case Language.ja:
      //   return const Locale("ja", "JP");
    }
  }

  String get title {
    switch (this) {
      case Language.zh:
        return "繁體中文";
      case Language.en:
        return "English";
      // case Language.ja:
      //   return "日本語";
    }
  }
}
