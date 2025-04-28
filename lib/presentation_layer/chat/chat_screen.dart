import 'package:flutter/material.dart';

import 'controller/chat_controller.dart';
import 'widgets/chat_area.dart';
import 'widgets/chat_controllers.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ChatController {

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              ChatArea(widgetList: widgetList),
              ChatControllers(
                deletAllChat: deletAllChat,
                sendText: sendText,
                controller: controller,
              ),
            ],
          ),
        ],
      ),
    );
  }
}