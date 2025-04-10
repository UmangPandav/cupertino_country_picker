import 'package:cupertino_country_picker/const.dart';
import 'package:cupertino_country_picker/theme_data.dart' show AppTheme;
import 'package:flutter/material.dart';

extension Context on BuildContext{
  double get h => MediaQuery.sizeOf(this).height;
  ThemeData get theme => Theme.of(this).brightness == Brightness.dark ? AppTheme(Brightness.dark) : AppTheme(Brightness.light);

  TextStyle get titleMedium => theme.textTheme.titleMedium!.copyWith(fontSize: 16, fontWeight: FontWeight.w500, color: theme.dividerColor);

  TextStyle get titleMediumThick => theme.textTheme.titleMedium!.copyWith(fontSize: 16, fontWeight: FontWeight.w600, color: theme.dividerColor);

  Color get black75{return theme.dividerColor.withValues(alpha: 0.75);}
  Color get black50{return theme.dividerColor.withValues(alpha: 0.50);}
  Color get shadowColor{return Colors.black.withValues(alpha: 0.05);}
  Color get borderColor{return theme.dividerColor.withValues(alpha: 0.1);}

  BorderSide get borderSide{return BorderSide(color: borderColor, width: borderWidth);}
  Border get boxBorder{return Border.all(color: borderColor, width: borderWidth);}
  List<BoxShadow> get boxShadow{return [BoxShadow(color: shadowColor, blurRadius: blurRadius)];}

  Divider divider({double? height}){
    return Divider(color: black75, thickness: 0.1, height: height);
  }

  BoxDecoration get boxDecoration{
    return BoxDecoration(
      border: boxBorder,
      boxShadow: boxShadow,
      color: theme.cardColor,
      borderRadius: BorderRadius.circular(borderRadius)
    );
  }
}