import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../logic/controller/items_result_controller.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/customButton.dart';
import '../widgets/proudctCard.dart';

class ItemsResult extends StatelessWidget {
  ItemsResult({super.key});

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
          Container(
            height: MediaQuery.of(context).size.height * 0.800,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FutureBuilder(
                      future: controller.getAllIkeaProudcts(),
                      builder: (context, snapshot) {
                        return GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.all(22.0),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20,
                            ),
                            itemCount: controller.ikeaProductsList.length,
                            itemBuilder: (BuildContext context, int index) {
                              controller.descListDallE.add(
                                  '${controller.ikeaProductsList[index].item} ${controller.ikeaProductsList[index].productDetails} in color ${controller.ikeaProductsList[index].color}');
                              controller.desginDesDallE.value =
                                  controller.descListDallE.join(' and ');

                              return ProudctCard(
                                imageUrl:
                                    controller.ikeaProductsList[index].imageUrl,
                                item: controller.ikeaProductsList[index].item,
                                price: controller.ikeaProductsList[index].price,
                              );
                            });
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
                      controller.sendShoppingListToDallE(
                          controller.desginDesDallE.value);
                      Get.toNamed('/designResult');
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    text: 'show me another suggestion',
                    textColor: mainColor,
                    color: BgColor,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
