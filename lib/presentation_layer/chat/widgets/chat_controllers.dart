import 'package:flutter/material.dart';
import 'package:simple_chat/presentation_layer/Utils/extenstions.dart';

import '../../Utils/design/app_colors/app_colors.dart';
import 'ktext_field_with_border.dart';

class ChatControllers extends StatelessWidget {
  final TextEditingController? controller;
  final Function() sendText , deletAllChat;
  const ChatControllers({
    this.controller,
    required this.deletAllChat,
    required this.sendText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      width: context.width,
      height: 100,
      color: appColors.primaryCardBackGroundColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          KTextFieldWithBorder(
            width: context.width * 0.70,
            height: 60,
            hint: "write your message",
            controller: controller,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 14),
            child: IconButton(
              onPressed: deletAllChat,
              icon: Icon(Icons.delete, size: 30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 14),
            child: IconButton(
              onPressed: sendText,
              icon: Icon(Icons.send, size: 30),
            ),
          ),
        ],
      ),
    );
  }
}
