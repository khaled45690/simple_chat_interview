
import 'package:flutter/material.dart';
import 'package:simple_chat/presentation_layer/Utils/extenstions.dart';

import '../../Utils/design/app_colors/app_colors.dart';

class ChatArea extends StatelessWidget {
  final List<Widget> widgetList;
  const ChatArea({this.widgetList = const [], super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: appColors.transparent,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: SizedBox(
              width: context.width,
              height: context.height - 100,

              child: ListView.builder(
                reverse: true,
                itemCount: widgetList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: widgetList[(widgetList.length - 1) - index],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
