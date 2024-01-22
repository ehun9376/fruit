import 'package:flutter/material.dart';

enum Language { zh }

extension LanguageValue on Language {
  Locale get locale {
    switch (this) {
      case Language.zh:
        return const Locale("zh", "TW");
    }
  }

  String get title {
    switch (this) {
      case Language.zh:
        return "繁體中文";
    }
  }
}
