import 'package:get/get.dart';

import 'Controllers/chat_controllers.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.put(ChatController());
  }
}
