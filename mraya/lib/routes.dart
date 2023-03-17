import 'package:get/get.dart';

import 'Views/Screens/chat_screen.dart';
import 'binding.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: "/", page: () => ChatPage(), binding: Binding()),
  ];
}
