import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:uuid/uuid.dart';
import '../services/ikea_proudcts.dart';

import '../Models/proudct_model.dart';

class ShoppingListController extends GetxController {

  var ikeaProductsList = <ProudctModel>[].obs;
   var isLoading = true.obs;

  onInit() {
   getAllIkeaProudcts();
   print('in onInit!!!!!!!!');
  }


    void getAllIkeaProudcts() async {
    var products = await IkeaProudctsService.getIkeaProudcts();
    try {
      isLoading(true);
      if (products.isNotEmpty) {

        ikeaProductsList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

 

}
