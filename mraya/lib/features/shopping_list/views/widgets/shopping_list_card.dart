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
      width: MediaQuery.of(context).size.width * 51.2,
      height: MediaQuery.of(context).size.height * 0.17,
      child: Align(
        alignment: Alignment.topLeft,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             SizedBox(
            width: MediaQuery.of(context).size.width * 0.040,
            ),
            Center(
              child: Image.network(
                imageUrl,
                  height: MediaQuery.of(context).size.height * 0.10,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:       
                  EdgeInsets.only(top: MediaQuery.of(context).size.height/30, left: MediaQuery.of(context).size.width/35),
                  child: Text(
                    item,
                    textAlign: TextAlign.start,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/90, left: MediaQuery.of(context).size.width/35),
                  child: Text(
                    '$price SAR',
                    style: const TextStyle(
                        color: Color(0xffb10CF82), fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Padding(
                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/35, top:  MediaQuery.of(context).size.height/95 ),                      child: const Text(
                        'From IKEA',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                     SizedBox(
                       width: MediaQuery.of(context).size.width * 0.10,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add_circle,
                          color: mainColor,
                        )),
                    const Text('1'),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.remove_circle, color: mainColor)),
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
