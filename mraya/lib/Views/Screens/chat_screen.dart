
import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:get/get.dart';
import 'package:mraya/Controllers/chat_controllers.dart';
 import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class ChatPage extends StatelessWidget {
  final ChatController controller = Get.find();
  ChatPage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() => Chat(
        theme: const DefaultChatTheme(
        inputBackgroundColor: Color.fromARGB(255, 226, 226, 226),
        inputTextColor: Colors.grey,
        primaryColor: Colors.grey,
        ),
        messages:controller.messages.value,
        bubbleBuilder: bubbleBuilder,
        onPreviewDataFetched: controller.handlePreviewDataFetched,
        onSendPressed: controller.handleSendPressed,
        showUserAvatars: true,
        showUserNames: true,
        user: controller.user,
      ),
      ),
    ));
  }

Widget bubbleBuilder(
  Widget child, {
  required message,
  required nextMessageInGroup,
}) =>
    Bubble(
      child: child,
      color: controller.user.id == message.author.id ||
              message.type == types.MessageType.image
          ? const Color(0xfff5f5f7)
          : const Color(0xff6f61e8),
      margin: nextMessageInGroup
          ? const BubbleEdges.symmetric(horizontal: 6)
          : null,
      nip: nextMessageInGroup
          ? BubbleNip.no
          : controller.user.id != message.author.id
              ? BubbleNip.leftBottom
              : BubbleNip.rightBottom,
    );
  
}
