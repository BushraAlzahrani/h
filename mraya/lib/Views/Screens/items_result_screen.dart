import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../Controllers/items_result_controller.dart';
import '../Widgets/customButton.dart';
import '../Widgets/proudctCard.dart';

class ItemsResult extends StatelessWidget {
  ItemsResult({super.key});

  final controller = Get.find<ItemsResultController>();

  @override
  Widget build(BuildContext context) {
    // print(
    //     'in screen!!!!!!!!!!!!!!!!!! ${controller.dallEResult.value} ?????????????');
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xffbEAF0EF),
      body:
          // Image.network(controller.dallEResult.value, height: 200, width: 200,),

          SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.all(22.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                itemCount: controller.ikeaProductsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProudctCard(
                    imageUrl: controller.ikeaProductsList[index].imageUrl,
                    item: controller.ikeaProductsList[index].item,
                    price: controller.ikeaProductsList[index].price,
                  );
                }),
            SizedBox(
              height: 100,
            ),
            CustomButton(
              text: 'Continue',
              isButtonDisabled: false,
              onPressed: () {
                // the dall-e function
              },
            ),
            CustomButton(
              text: 'show me another suggestion ',
              isButtonDisabled: true,
              onPressed: () {
                
              },
            ),
          ],
        ),
      ),
    ));
  }
}
