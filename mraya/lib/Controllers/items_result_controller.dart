import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import '../services/ikea_proudcts.dart';
import 'package:http/http.dart' as http;
import '../Models/proudct_model.dart';

class ItemsResultController extends GetxController {
  var ikeaProductsList = <ProudctModel>[].obs;
  var isLoading = true.obs;

  String open_ai_api_key =
      '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';

  String baseURL = 'https://api.openai.com/v1/images/generations';

  final dallEResult = ''.obs;

  onInit() {
    getAllIkeaProudcts();
    print('in onInit!!!!!!!!');
    // sendShoppingListToDallE();
  }

  void getAllIkeaProudcts() async {
    var products = await IkeaProudctsService.getIkeaProudcts();
    print('in getAllIkeaProudcts!!!!!!!!');
    try {
      isLoading(true);
      if (products.isNotEmpty) {
        ikeaProductsList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

  sendShoppingListToDallE() async {
    try {
      // final r = await http.post(Uri.https('api.openai.com', '/v1/images/generations'));
      final response = await http.post(Uri.parse('${baseURL}'),
          body:
              // {
              // "prompt": imgDesc,
              // "n":1,
              // "size":"500x500"
              // }
              json.encode({
            "prompt": "3d model dining room industrial style",
            "n": 1,
            "size": "1024x1024"
          }),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${open_ai_api_key}'
          });
      // log(json.decode(response.body));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        final url = data['data'][0]['url'];
        dallEResult.value = url;
        log(url);
        return url;
      } else {}
    } catch (e) {
      print('0-0-0-0 catch error dall-e!!!!!!!!');
      print(e.toString());
    }
  }
}
