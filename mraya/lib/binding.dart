import 'package:get/get.dart';

import 'Controllers/chat_controllers.dart';
import 'Controllers/items_result_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.put(ChatController());
    Get.put(ItemsResultController());
  }
}