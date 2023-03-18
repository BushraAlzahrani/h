import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controllers/items_result_controller.dart';
import '../../utils.dart';
import '../Widgets/customButton.dart';
import '../Widgets/shopping_list_card.dart';

class ShoppingList extends StatelessWidget {
  ShoppingList({super.key});

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
            FutureBuilder(
              future: controller.getAllIkeaProudcts(),
              builder: (context, snapshot) {
                return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.all(22.0),
                   
                    itemCount: controller.ikeaProductsList.length,
                    itemBuilder: (BuildContext context, int index) {

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: ShoppingListCard(
                          imageUrl: controller.ikeaProductsList[index].imageUrl,
                          item: controller.ikeaProductsList[index].item,
                          price: controller.ikeaProductsList[index].price,
                        ),
                      );
                    });
              }
            ),
            Divider(color: mainColor, thickness: 1,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
              Text('Total'),
               Text('price'),
            ],),
            SizedBox(
              height: 100,
            ),
            CustomButton(
              text: 'Continue',
              textColor: Colors.white,
              color: mainColor,
              onPressed: () {
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
    ));
  }
}
