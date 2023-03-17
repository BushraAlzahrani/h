import 'package:flutter/material.dart';

class ProudctCard extends StatelessWidget {
  const ProudctCard({super.key});

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
            child: Image.network(
              'https://www.ikea.com/sa/en/images/products/moerbylanga-table-oak-veneer-brown-stained__0737110_pe740888_s5.jpg?f=xl',
              height: 100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              'title',
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              '100 SAR',
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
                color: Color(0xffbBB2649),
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
