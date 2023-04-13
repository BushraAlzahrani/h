import 'package:get/get.dart';
import '../../features/chat/logic/controller/chat_controllers.dart';
import '../../features/shopping_list/logic/controller/items_result_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.put(ChatController());
    Get.put(ItemsResultController());
  }
}
