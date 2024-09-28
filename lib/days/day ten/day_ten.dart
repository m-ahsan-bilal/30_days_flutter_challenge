import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_challenge/days/day%20ten/model_grid_view.dart';
import 'package:flutter_challenge/days/day%20ten/product_card.dart';
import 'package:go_router/go_router.dart';

class DayTen extends StatelessWidget {
  const DayTen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade500,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.go('/');
            },
            icon: const Icon(Icons.arrow_back)),
        title: Text(
          'Day 10',
          style: TextStyle(
            color: Colors.lightGreen.shade500,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // no of columns
                crossAxisSpacing: 10.0, // space btx columns
                mainAxisSpacing: 10.0, // btw rows
                childAspectRatio:
                    0.8 // adjust to control item height and width ratio
                ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductCard(product: product);
            }),
      ),
    );
  }
}
