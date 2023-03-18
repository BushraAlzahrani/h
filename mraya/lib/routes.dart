import 'package:get/get.dart';
import 'package:mraya/Views/Screens/done.dart';

import 'Views/Screens/chat_screen.dart';
import 'Views/Screens/splash.dart';
import 'binding.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: "/", page: () => ChatPage(), binding: Binding()),
    GetPage(name: "/splash", page: () => Splash(), binding: Binding()),
    GetPage(name: "/done", page: () => Done(), binding: Binding()),

    
  ];
}
