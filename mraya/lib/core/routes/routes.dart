import 'package:get/get.dart';
import 'package:mraya/initial/views/screens/done.dart';
import '../../features/chat/views/screens/chat_screen.dart';
import '../../initial/views/screens/splash.dart';
import '../../features/shopping_list/views/screens/design_result_screen.dart';
import '../../features/shopping_list/views/screens/items_result_screen.dart';
import '../../features/shopping_list/views/screens/shopping_list_screen.dart';

import '../binding/binding.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: "/", page: () => ChatPage(), binding: Binding()),

    GetPage(
        name: "/itemsResult", page: () => ItemsResult(), binding: Binding()),
    GetPage(
        name: "/designResult", page: () => DesignResult(), binding: Binding()),
    GetPage(
        name: "/shoppingList", page: () => ShoppingList(), binding: Binding()),

    GetPage(name: "/splash", page: () => Splash(), binding: Binding()),
    GetPage(name: "/done", page: () => Done(), binding: Binding()),



    

  ];
}
