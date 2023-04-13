import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/date_symbol_data_local.dart';
import 'package:uuid/uuid.dart';

import '../service/chatGpt.dart';

class ChatController extends GetxController {
  final messages = <types.Message>[].obs;
  List<String> chatGPTMaessages = [];
  List<String> userMaessages = [];
  final user = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac');
  final chatGPT = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3gpt');
  final myList = "".obs;

  onInit() {
    loadMessages();
    chatGPTReply("hi ..... ");
    userMaessages.clear();
    chatGPTMaessages.clear();
    messages.clear();
  }

  void loadMessages() async {
    final response = await rootBundle.loadString('assets/messages.json');
    final all_messages = (jsonDecode(response) as List)
        .map((e) => types.Message.fromJson(e as Map<String, dynamic>))
        .toList();
    messages.value = all_messages;
    ;
  }

  void handlePreviewDataFetched(
    types.TextMessage message,
    types.PreviewData previewData,
  ) {
    final index = messages.indexWhere((element) => element.id == message.id);
    final updatedMessage = (messages[index] as types.TextMessage).copyWith(
      previewData: previewData,
    );
    messages[index] = updatedMessage;
  }

  void handleSendPressed(types.PartialText message) async {
    final textMessage = types.TextMessage(
      author: user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );

    var rep = await ChatGpt().talkToChatGpt("user", message.text);
    addMessage(textMessage);
    addUserMessage(message.text);
    if (userMaessages[0] == "thanks" || userMaessages[0] == 'Thanks') {
      Future.delayed(Duration(milliseconds: 2000), () {
        Get.toNamed("/itemsResult");
      });
    }

    chatGPTReply(rep.toString());
  }

  void chatGPTReply(String message) {
    final textMessage = types.TextMessage(
      author: chatGPT,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message,
    );
    addMessage(textMessage);
    addChatGPTMessage(message);
    // if (message.length >= 200) {
    //   myList.value = message;
    //   Get.toNamed("/itemsResult");
    // }
    // if (message.length >= 1000) {
    //   myList.value = message;
    //   print("aaaa");
    //   Get.toNamed("/itemsResult");
    // }
  }

  void addMessage(types.Message message) {
    messages.insert(0, message);
  }

  void addUserMessage(String message) {
    userMaessages.insert(0, message);
  }

  void addChatGPTMessage(String message) {
    chatGPTMaessages.insert(0, message);
  }
}
