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

  final descListDallE = [].obs;
  final desginDesDallE = ''.obs;

  onInit() {
    getAllIkeaProudcts();
    print('in onInit!!!!!!!!');
    // sendShoppingListToDallE(desginDesDallE.value);
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

  sendShoppingListToDallE(String imgDesc) async {
    print('enter Dall-E fnction');
    print(imgDesc);
    try {
      final response = await http.post(Uri.parse('${baseURL}'),
          body:
              json.encode({
            "prompt": "3d model dining room with $imgDesc",
            "n": 1,
            "size": "512x512"
          }),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${open_ai_api_key}'
          });
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        final url = data['data'][0]['url'];
        dallEResult.value = url;
        print(url);
        return url;
      } else {}
    } catch (e) {
      print('0-0-0-0 catch error dall-e!!!!!!!!');
      print(e.toString());
    }
  }
}