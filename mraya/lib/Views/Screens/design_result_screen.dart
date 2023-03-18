import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../Controllers/items_result_controller.dart';
import '../../utils.dart';
import '../Widgets/customButton.dart';

class DesignResult extends StatelessWidget {
  DesignResult({super.key});
  final controller = Get.find<ItemsResultController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(
                'Chat with Maraya',
                style: TextStyle(color: Colors.black),
              ),
            ),
            backgroundColor: BgColor,
            body: Padding(
              padding: const EdgeInsets.all(22.0),
              child: Column(
                children: [
               
                 Obx(() =>  controller.dallEResult.isEmpty
                      ? Container(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(mainColor),
                    ),
                  )
                      : Image.network(
                          controller.dallEResult.value,
                          height: 400,
                          width: 400,
                        ),
                 ),

                  SizedBox(
                    height: 100,
                  ),
                  CustomButton(
                    text: 'Continue',
                    textColor: Colors.white,
                    color: mainColor,
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    text: 'show me another suggestion ',
                    textColor: mainColor,
                    color: BgColor,
                    onPressed: () {
                      controller.sendShoppingListToDallE(
                          controller.desginDesDallE.value);
                    },
                  ),
                ],
              ),
            )));
  }
}
