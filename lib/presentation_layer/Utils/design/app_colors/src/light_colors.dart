import 'package:flutter/material.dart';

import '../app_colors.dart';

class LightColors implements AppColorsInterface {
  @override
  Color disableColor = Color.fromARGB(255, 164, 164, 172);

  @override
  Color enableColor = Color(0xFF5A5A90);

  @override
  Color primaryBackGroundColor = Color.fromARGB(255, 226, 226, 238);

  @override
  Color secondaryBackGroundColor = Color(0xFF9393cb);
  @override
  Color primaryCardBackGroundColor = Colors.white;

  @override
  Color primaryColor = Color(0xFF5A5A90);
  @override
  Color errorColor = Color.fromARGB(255, 192, 31, 31);
  @override
  Color successColor = Color.fromARGB(255, 8, 145, 31);
  @override
  Gradient primaryGradient = LinearGradient(
    begin: AlignmentDirectional.centerStart,
    end: AlignmentDirectional.bottomEnd,
    colors: [Color(0xFF5A5A90), Color(0xFF9393CB)],
  );
  @override
  Gradient secondaryGradient = LinearGradient(
    begin: AlignmentDirectional.bottomCenter,
    end: AlignmentDirectional.topCenter,
    colors: [
      Color(0xFF7575a9),
      Color(0xFF8383b6),
      Color(0xFF8383b6),
      Color(0xFF7575a9),
    ],
  );

  @override
  Color primaryTextColor = Colors.black;
  @override
  Color secondaryTextColor = Colors.white;

  @override
  Color secondaryButtonColor = Colors.white;

  @override
  Color transparent = Colors.transparent;
}

class AppColorssss {
  static const Color primaryTextColor = Color(0xFFFFFFFF);
  static const Color secondaryColor = Color(0xFF5A5A90);
  static const Color secondaryTextColor = Color(0xFF000000);
  static const Color greyColor = Color.fromARGB(255, 226, 226, 238);
  static const Color transparent = Colors.transparent;
  // static const Color secondaryColor = Color(0xFF9393CB);
  // static const Color backgroundColor = Color(0xFFF5F5F5);
  // static const Color textColor = Color(0xFF333333);
  // static const Color accentColor = Color(0xFFE0E0E0);
  Gradient primaryGradient = LinearGradient(
    begin: AlignmentDirectional.centerStart,
    end: AlignmentDirectional.bottomEnd,
    colors: [Color(0xFF5A5A90), Color(0xFF9393CB)],
  );
}
