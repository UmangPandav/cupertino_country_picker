import 'dart:ui' show TextStyle, Color;
import 'package:flutter/material.dart' show ShapeBorder, InputDecoration;

class CountryPickerDecoration {
  final String titleText;
  final String closeButtonText;
  final TextStyle? titleTextStyle;
  final TextStyle? closeButtonTextStyle;
  final bool canSearch;
  final Color? backgroundColor;
  final Color? cardColor;
  final Color? appBarBackgroundColor;
  final ShapeBorder? shape;
  final InputDecoration? searchInputDecoration;

  const CountryPickerDecoration({
    this.titleText = 'Country',
    this.closeButtonText = 'Close',
    this.titleTextStyle,
    this.closeButtonTextStyle,
    this.canSearch = true,
    this.backgroundColor,
    this.cardColor,
    this.appBarBackgroundColor,
    this.shape,
    this.searchInputDecoration,
  });
}
