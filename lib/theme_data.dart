// ignore_for_file: deprecated_member_use, non_constant_identifier_names
import 'package:cupertino_country_picker/country_picker_helper.dart';
import 'package:cupertino_country_picker/gen/fonts.gen.dart' show FontFamily;
import 'package:flutter/material.dart';

Color cardColorLight = const Color(0xFFFAFAFA);
Color cardColorDark = const Color(0xFF13131B);
Color scaffoldBgColorLight = const Color(0xFFEFF1F3);
Color scaffoldBgColorDark = const Color(0xFF000000);

ThemeData AppTheme(Brightness theme) {
  final isDark = theme == Brightness.dark;
  final dividerColor = isDark ? Colors.white : Colors.black;
  final cardColor = isDark ? cardColorDark : cardColorLight;
  final scaffoldBackgroundColor =
      isDark ? scaffoldBgColorDark : scaffoldBgColorLight;
  return ThemeData(
    useMaterial3: true,
    package: CountryPickerHelper.packageName,
    fontFamily: FontFamily.publicSans,
    cardColor: cardColor,
    dividerColor: dividerColor,
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    textSelectionTheme: TextSelectionThemeData(
        cursorColor: dividerColor,
        selectionHandleColor: dividerColor,
        selectionColor: dividerColor.withValues(alpha: 0.1)),
  );
}
