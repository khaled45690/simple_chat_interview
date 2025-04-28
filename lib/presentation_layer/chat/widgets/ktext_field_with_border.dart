import 'package:flutter/material.dart';
import 'package:simple_chat/presentation_layer/Utils/extenstions.dart';

import '../../Utils/design/app_colors/app_colors.dart';

class KTextFieldWithBorder extends StatelessWidget {
  final String? hint , errorText;
  final double? height, width;
  final Widget? icon, prefixIcon;
  final bool isSecured, isEditable, isSecondary;
  final TextInputType? keyboardType;
  final TextDirection? textDirection;
  final Function()? changeSecure, onCountryPress;
  final Function(String value)? onChangeValue;
  final TextEditingController? controller;

  const KTextFieldWithBorder({
    this.icon,
    this.height,
    this.width,
    this.hint,
    this.isSecured = false,
    this.isEditable = true,
    this.isSecondary = false,
    this.prefixIcon,
    this.changeSecure,
    this.errorText,
    this.onChangeValue,
    this.onCountryPress,
    this.keyboardType,
    this.textDirection,
    super.key,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {

    return ClipRRect(
      child: Container(
        margin: const EdgeInsets.only(bottom: 5),
        height: height,
        width: width ?? context.width - 150,
        child: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: TextField(
            onChanged: onChangeValue,
            controller: controller,
            cursorColor: Colors.black,
            showCursor: true,
            enabled: isEditable,
            obscureText: isSecured,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              fillColor:
                  isSecondary
                      ? appColors.primaryCardBackGroundColor
                      : Colors.transparent,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(width: 1, color: Colors.grey),
              ),
              // floatingLabelStyle: Theme.of(context).textTheme.labelLarge,
              prefixIcon: icon,
              hintText: hint,
              filled: isSecondary,
              hintStyle: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
              // prefixText: getPrefixText(),
              suffixIcon: prefixIcon,
              errorText: errorText,
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(width: 2, color: Colors.red),
              ),
              // suffixText: getSuffixText(),
            ),
            textDirection: textDirection,
            textAlignVertical: TextAlignVertical.bottom,
            style: TextStyle(
              color: isEditable ? Colors.grey : Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
