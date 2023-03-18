import 'package:flutter/material.dart';
import 'package:mraya/utils.dart';

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
      width: 200,
      height: 183,
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
              height: 100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              item,
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
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
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'From Ikea',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              MaterialButton(
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
