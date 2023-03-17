import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../Controllers/shopping_list_controller.dart';
import '../Widgets/customButton.dart';
import '../Widgets/proudctCard.dart';

class ShoppingList extends StatelessWidget {
   ShoppingList({super.key});

    final controller = Get.find<ShoppingListController>();

  @override
  Widget build(BuildContext context) {
    print('in screen!!!!!!!!!!!!!!!!!! ${controller.dallEResult.value} ?????????????');
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xffbEAF0EF),
      body: 
      Image.network(controller.dallEResult.value, height: 200, width: 200,),
      
      // SingleChildScrollView (
      //   child: Column(
      //     children: [
      //       GridView.builder(
      //           physics: NeverScrollableScrollPhysics(),
      //           shrinkWrap: true,
      //         padding: EdgeInsets.all(22.0),
      //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //             crossAxisCount: 2,
      //             mainAxisSpacing: 20,
      //             crossAxisSpacing: 20,
      //           ),
      //           itemCount: 8,
      //           itemBuilder: (BuildContext context, int index) {
      //             return ProudctCard();
      //           }),
      //           SizedBox(height: 100,),
      //           CustomButton(text: 'Continue', isButtonDisabled: false,),
      //           CustomButton(text: 'show me another suggestion ', isButtonDisabled: true,),
      
      //     ],
      //   ),
      // ),

    ));
  }
}
