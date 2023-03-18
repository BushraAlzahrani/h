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
          body: Container(height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height*0.1,
                child: Padding(
                  
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Center(
                    child: Row(
                            children: const [
                              Image(
                  image: AssetImage('assets/photo.png'),
                  height: 50,
                  width: 50,
                              ),
                              SizedBox(
                  width: 5,
                              ),
                              Text(
                  "Chat with Maraya",
                  style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                  width: 5,
                              ),
                              Image(
                  image: AssetImage('assets/Ellipse.png'),
                  width: 8,
                  height: 8,
                              ),
                            ],
                          ),
                  ),
                ),
                ),
              Container(height: MediaQuery.of(context).size.height*0.001 ,color: Color.fromARGB(255, 225, 225, 225),),
              Container(
                height: MediaQuery.of(context).size.height*0.799,
                child:Obx(() => Chat(
          theme: const DefaultChatTheme(
            inputBackgroundColor: Color.fromARGB(255, 236, 236, 236),
            inputTextColor: Colors.grey,
            primaryColor: Colors.grey,
          ),
          messages: controller.messages.value,
          bubbleBuilder: bubbleBuilder,
          onPreviewDataFetched: controller.handlePreviewDataFetched,
          onSendPressed: controller.handleSendPressed,
          showUserNames: true,
          user: controller.user,
        ),
      ) ,

                ),

            ],
          ),
          ),
    /*   appBar: AppBar(
        backgroundColor: Colors.white,
        backwardsCompatibility: false,
        elevation: 1,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
          child: Row(
            children: const [
              Image(
                image: AssetImage('assets/photo.png'),
                height: 50,
                width: 50,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Chat with Maraya",
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(
                width: 5,
              ),
              Image(
                image: AssetImage('assets/Ellipse.png'),
                width: 8,
                height: 8,
              ),
            ],
          ),
        ),
      ),
      body: Obx(
        () => Chat(
          theme: const DefaultChatTheme(
            inputBackgroundColor: Color.fromARGB(255, 236, 236, 236),
            inputTextColor: Colors.grey,
            primaryColor: Colors.grey,
          ),
          messages: controller.messages.value,
          bubbleBuilder: bubbleBuilder,
          onPreviewDataFetched: controller.handlePreviewDataFetched,
          onSendPressed: controller.handleSendPressed,
          showUserNames: true,
          user: controller.user,
        ),
      ), */
    ));
  }

  Widget bubbleBuilder(
    Widget child, {
    required message,
    required nextMessageInGroup,
  }) =>
      Bubble(
        child: child,
        color: controller.user.id != message.author.id
            ? Color.fromRGBO(208, 161, 172, 1)
            : Color.fromRGBO(135, 45, 67, 1),
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
