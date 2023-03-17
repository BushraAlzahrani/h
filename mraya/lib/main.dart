
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mraya/routes.dart';
import 'Views/Screens/chat_screen.dart';
import 'Views/Screens/shoppingList.dart';


void main() {
  initializeDateFormatting().then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/shoppingList",
    getPages: AppRoutes.pages,
    // home: ShoppingList(),
       );
}

