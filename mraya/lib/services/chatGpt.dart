import 'dart:convert';
import 'package:http/http.dart' as http;

import '../api.dart';

class ChatGpt {
  Future<String> talkToChatGpt(String role, String content) async {
    try {
      final response = await http.post(Uri.parse('${vectaraBaseURL}'),
          body: json.encode({
            "model": "gpt-3.5-turbo",
            "messages": [
              {"role": role, "content": content}
            ]
          }),
          headers: {
            'customer-id': customerId,
            'x-api-key': vectaraApiKey,
          });
      if (response.statusCode == 200) {
        // Get.snackbar(
        //   "Succes",
        //   "Added article",
        //   snackPosition: SnackPosition.TOP,
        //   backgroundColor: whiteColor,
        // );
        var data = json.decode(response.body);
        return data['choices'][0]['message']['content'];
      } else {
        return 'error';
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
