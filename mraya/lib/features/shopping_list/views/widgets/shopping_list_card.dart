import 'package:flutter/material.dart';
import 'package:mraya/core/theme/app_colors.dart';

class ShoppingListCard extends StatelessWidget {
  String imageUrl;
  String item;
  String price;
  ShoppingListCard({
    super.key,
    required this.imageUrl,
    required this.item,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      width: 200,
      height: 150,
      child: Align(
        alignment: Alignment.topLeft,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 15,
            ),
            Center(
              child: Image.network(
                imageUrl,
                height: 100,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, left: 10.0),
                  child: Text(
                    item,
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    '$price SAR',
                    style: TextStyle(
                        color: Color(0xffb10CF82), fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'From IKEA',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_circle,
                          color: mainColor,
                        )),
                    Text('1'),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.remove_circle, color: mainColor)),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
