import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../chat_screen.dart';
import '../widgets/chat_text_widget.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

abstract class ChatController extends State<ChatScreen> {
  double height = 0, bottom = 0;
  List<String> dropDownList = ["Selection", "citizen", "PR", "TR"];
  String dropDownText = "Selection";
  FirebaseDatabase database = FirebaseDatabase.instance;
  late DatabaseReference rtdb;
  List<Widget> widgetList = [];
  List<MessageData> messages = [];
  TextEditingController controller = TextEditingController();
  String userToken = "";

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  sendText() {
    if (controller.text.isNotEmpty) {
      widgetList.add(ChatTextWidget(text: controller.text, isFromUser: true));
      messages.add(MessageData(message: controller.text, userID: userToken));
      FocusScope.of(context).unfocus();
      rtdb.update({'chat': jsonEncode(MessageData.toJsonList(messages))});
      controller.clear();
      setState(() {});
    }
  }

  deletAllChat() {
    widgetList = [];
    messages = [];
    rtdb.update({'chat': jsonEncode([])});
    setState(() {});
  }

  _init() async {
    final firebaseApp = Firebase.app();
    userToken = await FirebaseMessaging.instance.getToken() ?? "";
    rtdb = FirebaseDatabase.instanceFor(
      app: firebaseApp,
      databaseURL:
          'https://botps-1da99-default-rtdb.europe-west1.firebasedatabase.app/',
    ).ref().child("chat");
    DataSnapshot data = await rtdb.child("chat").get();
    if (data.exists) {
      _recievedData(data.value.toString());
    } else {
      rtdb.update({'chat': jsonEncode([])});
    }
    rtdb.onValue.listen((DatabaseEvent event) {
      _recievedData(event.snapshot.child("chat").value.toString());
      setState(() {});
    });

    setState(() {});
    // rtdb.ref().;
  }

  _recievedData(String jsonString) {
    try {
      List messagesJson = jsonDecode(jsonString);
      widgetList = [];
      messages = [];
      for (var i = 0; i < messagesJson.length; i++) {
        MessageData data = MessageData.fromJsogn(messagesJson[i]);
        messages.add(data);
        widgetList.add(
          ChatTextWidget(
            text: data.message,
            isFromUser: data.userID == userToken,
          ),
        );
      }
    } catch (e) {
      rtdb.update({'chat': jsonEncode([])});
    }
  }
}

class MessageData {
  String userID, message;
  MessageData({required this.userID, required this.message});
  Map toJson() {
    return {"userID": userID, "message": message};
  }

  factory MessageData.fromJsogn(Map json) {
    return MessageData(userID: json["userID"], message: json["message"]);
  }
  static List<Map> toJsonList(List<MessageData> list) {
    List<Map> resut = [];
    for (var i = 0; i < list.length; i++) {
      resut.add(list[i].toJson());
    }
    return resut;
  }
}
