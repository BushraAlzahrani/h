import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../core/constants/api.dart';

class ChatGpt {

  Future<String> talkToChatGpt(String role, String content) async {
    try {
      final response = await http.post(Uri.parse('${chatGptBaseUrl}'),
          body: json.encode({
            "model": "gpt-3.5-turbo",
            "messages": [
              {"role": role, "content": content}
            ]
          }),
          headers: {
              'Content-Type': 'application/json',
            'Authorization': 'Bearer $chatGptApiKey',
           
          });
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return data['choices'][0]['message']['content'];
      } else {
        return  response.statusCode.toString();
        // var data = jsonDecode(response.body.toString());
        // print(data);
        // Get.snackbar(
        //   "Faild",
        //   data.toString(),
        //   snackPosition: SnackPosition.TOP,
        //   backgroundColor: whiteColor,
        // );
      }
    } catch (e) {
      return e.toString();
    }
  }
}
 