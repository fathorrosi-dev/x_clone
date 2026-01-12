import 'package:flutter/material.dart';
import '../theme/styles/app_corners.dart';

/// Extension on [BuildContext] to easily access corner radius values
extension ThemeCornersX on BuildContext {
  /// Material 3 Shape Scale Constants
  double get cornerNone => AppCorners.none;
  double get cornerExtraSmall => AppCorners.extraSmall;
  double get cornerSmall => AppCorners.small;
  double get cornerMedium => AppCorners.medium;
  double get cornerLarge => AppCorners.large;
  double get cornerExtraLarge => AppCorners.extraLarge;
  double get cornerFull => AppCorners.full;

  /// Material 3 Component Specific Border Radii
  BorderRadius get bottomSheetRadius => AppCorners.bottomSheet;
  BorderRadius get cardRadius => AppCorners.card;
  BorderRadius get cardFullRadius => AppCorners.cardFull;
  BorderRadius get dialogRadius => AppCorners.dialog;
  BorderRadius get buttonRadius => AppCorners.button;
  BorderRadius get buttonSquaredRadius => AppCorners.buttonSquared;
  BorderRadius get textFieldRadius => AppCorners.textField;
  BorderRadius get checkboxRadius => AppCorners.checkbox;
  BorderRadius get chipRadius => AppCorners.chip;
  BorderRadius get tooltipRadius => AppCorners.tooltip;
  BorderRadius get snackbarRadius => AppCorners.snackbar;
  BorderRadius get fabRadius => AppCorners.fab;
  BorderRadius get extendedFabRadius => AppCorners.extendedFab;

  /// Shape Builders
  RoundedRectangleBorder cardShape({bool full = false}) =>
      AppCorners.cardShape(full: full);

  RoundedRectangleBorder buttonShape({bool squared = false}) =>
      AppCorners.buttonShape(squared: squared);
}
