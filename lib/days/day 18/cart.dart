import 'package:flutter/material.dart';
import 'package:flutter_challenge/days/day%2016/day_16.dart';
import 'package:flutter_challenge/days/day%2018/models/cart_item.dart';
import 'package:flutter_challenge/days/day%2018/models/restaurant.dart';
import 'package:flutter_challenge/utils/my_cart_tile.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child) {
      // cart
      final userCart = restaurant.cart;

      // Scaffolf UI
      return Scaffold(
        appBar: AppBar(
          title: const Text('C A R T'),
          leading: IconButton(
              onPressed: () {
                context.go('/home_dash');
              },
              icon: const Icon(Icons.arrow_back)),
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: userCart.length,
                  itemBuilder: (context, index) {
                    // get individual cart item
                    final cartItem = userCart[index];
                    // return
                    return MyCartTile(
                      cartItem: cartItem,
                      restaurant: restaurant,
                    );
                  }),
            ),
          ],
        ),
      );
    });
  }
}
