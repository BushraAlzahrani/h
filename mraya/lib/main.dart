import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mraya/features/shopping_list/logic/controller/items_result_controller.dart';
import 'package:mraya/core/routes/routes.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'features/chat/views/screens/chat_screen.dart';
import 'features/shopping_list/views/screens/items_result_screen.dart';

void main() {
  
  initializeDateFormatting().then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // initialRoute: "/",
        // initialRoute: "/shoppingList",
        // initialRoute: "/designResult",
         initialRoute: "/splash",
        getPages: AppRoutes.pages,
        // home: ShoppingList(),
      );
}
