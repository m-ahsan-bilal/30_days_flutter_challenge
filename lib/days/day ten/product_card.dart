import 'package:flutter/material.dart';
import 'package:flutter_challenge/days/day%20ten/model_grid_view.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightGreen,
      elevation: 5.0, // shadow  od card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Image.asset(
            product.imageUrl,
            fit: BoxFit.cover,
          )),
          Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                product.title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}
