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
            backgroundColor: BgColor,
            body: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Center(
                      child: Row(
                        children: const [
                          Image(
                            image: AssetImage('assets/photo.png'),
                            height: 50,
                            width: 50,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Chat with Maraya",
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Image(
                            image: AssetImage('assets/Ellipse.png'),
                            width: 8,
                            height: 8,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Column(
                    children: [
                      Obx(
                        () => controller.dallEResult.isEmpty
                            ? Container(
                                height: 50,
                                width: 50,
                                child: CircularProgressIndicator(
                                  valueColor: new AlwaysStoppedAnimation<Color>(
                                      mainColor),
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
                ),
              ],
            )));
  }
}
