import 'package:flutter/material.dart';

import 'src/light_colors.dart';

 AppColorsInterface get appColors  {
  return LightColors();

}

abstract class AppColorsInterface {
    late final Color primaryBackGroundColor;
    late final Color primaryCardBackGroundColor;
    late final Color secondaryBackGroundColor;
    late final Color primaryColor;
    late final Color primaryTextColor;
    late final Color secondaryTextColor;
    late final Color transparent;
    late final Color errorColor;
    late final Color successColor;
    late final Color disableColor;
    late final Color enableColor;
    late final Color secondaryButtonColor;
    late final Gradient primaryGradient;
    late final Gradient secondaryGradient;
}


