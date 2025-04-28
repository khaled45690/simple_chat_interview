import 'package:flutter/material.dart';

import '../../Utils/design/app_colors/app_colors.dart';
import '../../Utils/design/app_text_style/app_text_style.dart';

class ChatTextWidget extends StatelessWidget {
  final bool isFromUser;
  final String text;
  const ChatTextWidget({this.isFromUser = false, this.text = "", super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isFromUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        ClipRRect(
          child: Container(
             constraints: BoxConstraints(minWidth: 0, maxWidth: 300),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isFromUser ? appColors.primaryColor : appColors.primaryCardBackGroundColor,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Text(text, 
            style: isFromUser ? appTextStyle.body2MediumSecondary14 : appTextStyle.body2MediumPrimary14,
            
            ),
          ),
        ),
      ],
    );
  }
}