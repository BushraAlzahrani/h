import 'package:flutter/material.dart';
import 'package:mraya/core/theme/app_colors.dart';

class ProudctCard extends StatelessWidget {
  String imageUrl;
  String item;
  String price;
  ProudctCard({
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

      // height: 183,
      width: MediaQuery.of(context).size.width * 55.2,
      // height: MediaQuery.of(context).size.height * 0.10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child:
                // Image.network(
                //   'https://www.ikea.com/sa/en/images/products/moerbylanga-table-oak-veneer-brown-stained__0737110_pe740888_s5.jpg?f=xl',
                //   height: 100,
                // ),

                Image.network(
              imageUrl,
              height: MediaQuery.of(context).size.height * 0.10,
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width /  46),
            child: Text(
              item,
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width /  46),
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
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 46),
                child: const Text(
                  'From IKEA',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              MaterialButton(
                // height: MediaQuery.of(context).size.height / 35,
                onPressed: () {},
                color: mainColor,
                textColor: Colors.white,
                child: Icon(
                  Icons.add,
                  size: 20,
                  
                ),
                // padding: EdgeInsets.all(4),
                shape: CircleBorder(),
              )
            ],
          )
        ],
      ),
    );
  }
}
