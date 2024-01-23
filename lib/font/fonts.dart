enum FontFamily { sFProDisplayRegular }

extension FontFamilyValue on FontFamily {
  String get value {
    switch (this) {
      case FontFamily.sFProDisplayRegular:
        return "SFProDisplay";
    }
  }
}
