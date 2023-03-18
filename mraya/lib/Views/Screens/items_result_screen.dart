import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../Controllers/items_result_controller.dart';
import '../../utils.dart';
import '../Widgets/customButton.dart';
import '../Widgets/proudctCard.dart';

class ItemsResult extends StatelessWidget {
  ItemsResult({super.key});

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
      body: SingleChildScrollView(
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
              textColor: Colors.white,
              color: mainColor,
              onPressed: () {
                // the dall-e function
              },
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              text: 'show me another suggestion ',
              textColor: mainColor,
              color: BgColor,
              onPressed: () {},
            ),
          ],
        ),
      ),
    ));
  }
}
