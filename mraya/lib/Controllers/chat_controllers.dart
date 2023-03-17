import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/date_symbol_data_local.dart';
import 'package:mraya/Services/chatGpt.dart';
import 'package:uuid/uuid.dart';

class ChatController extends GetxController {
  onInit() {
    loadMessages();
    chatGPTReply("hi ..... ");
  }

  final messages = <types.Message>[].obs;
  final user = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac');
  final chatGPT = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3gpt');

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
  }

  void addMessage(types.Message message) {
    messages.insert(0, message);
  }

  void handleMessageTap(BuildContext _, types.Message message) async {
    if (message is types.FileMessage) {
      var localPath = message.uri;

      if (message.uri.startsWith('http')) {
        try {
          final index =
              messages.indexWhere((element) => element.id == message.id);
          final updatedMessage =
              (messages[index] as types.FileMessage).copyWith(
            isLoading: true,
          );
          messages[index] = updatedMessage;

          final client = http.Client();
          final request = await client.get(Uri.parse(message.uri));
          final bytes = request.bodyBytes;

          if (!File(localPath).existsSync()) {
            final file = File(localPath);
            await file.writeAsBytes(bytes);
          }
        } finally {
          final index =
              messages.indexWhere((element) => element.id == message.id);
          final updatedMessage =
              (messages[index] as types.FileMessage).copyWith(
            isLoading: null,
          );

          messages[index] = updatedMessage;
        }
      }
    }
  }
}
