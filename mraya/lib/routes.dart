import 'package:get/get.dart';

import 'Views/Screens/chat_screen.dart';
import 'Views/Screens/design_result_screen.dart';
import 'Views/Screens/items_result_screen.dart';
import 'Views/Screens/shopping_list_screen.dart';
import 'binding.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: "/", page: () => ChatPage(), binding: Binding()),
    GetPage(
        name: "/itemsResult", page: () => ItemsResult(), binding: Binding()),
    GetPage(
        name: "/designResult", page: () => DesignResult(), binding: Binding()),
    GetPage(
        name: "/shoppingList", page: () => ShoppingList(), binding: Binding()),
  ];
}
