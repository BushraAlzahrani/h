import 'package:get/get.dart';

import 'Controllers/chat_controllers.dart';
import 'Controllers/shopping_list_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.put(ChatController());
     Get.put(ShoppingListController());
  }
}
