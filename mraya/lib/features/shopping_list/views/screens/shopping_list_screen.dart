import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../logic/controller/items_result_controller.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/customButton.dart';
import '../widgets/shopping_list_card.dart';

class ShoppingList extends StatelessWidget {
  ShoppingList({super.key});

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
                      
                    Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: Text('Total', style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right:8.0),
                      child: Text('2,612 SR', style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                  ],),
                  SizedBox(
                    height: 100,
                  ),
                  CustomButton(
                    text: 'Continue',
                    textColor: Colors.white,
                    color: mainColor,
                    onPressed: () {
                            Get.toNamed("/done");
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
