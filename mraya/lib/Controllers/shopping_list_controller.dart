import 'dart:convert';
import 'package:get/get.dart';
import '../services/ikea_proudcts.dart';
import 'package:http/http.dart' as http;
import '../Models/proudct_model.dart';

class ShoppingListController extends GetxController {
  var ikeaProductsList = <ProudctModel>[].obs;
  var isLoading = true.obs;

  String open_ai_api_key =
      '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';

  String baseURL = 'https://api.openai.com/v1/images/generations';

  final dallEResult= ''.obs;

  onInit() {
    getAllIkeaProudcts();
    print('in onInit!!!!!!!!');
    sendShoppingListToDallE("3d model dining room industrial style");
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

  Future<String?> sendShoppingListToDallE(String imgDesc)async{

     try {
      final response = await http.post(Uri.parse('${baseURL}'), body: {
      "prompt": imgDesc,
      "n":1,
      "size":"500x500"
      }, headers: {
        'Authorization': 'Bearer ${open_ai_api_key}'
      });
      if (response.statusCode == 200) {
        print('dall-e Succes!!!!!!!!!!!!!!!!!!!!');
         var data = jsonDecode(response.body.toString());
        print('_______________________________________________${data['data']['url']}');

        dallEResult.value= data['data'][0]['url'];

        return data['data']['url'];

      } else {
        print('0-0-0-0 error dall-e!!!!!!!!');
    
      }
    } catch (e) {
       print('0-0-0-0 catch error dall-e!!!!!!!!');
      print(e.toString());
    }
  
  }

  }


   

