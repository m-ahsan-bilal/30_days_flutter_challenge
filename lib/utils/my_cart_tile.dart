import 'package:flutter/material.dart';
import 'package:flutter_challenge/days/day%2018/models/cart_item.dart';
import 'package:flutter_challenge/days/day%2018/models/restaurant.dart';
import 'package:flutter_challenge/utils/my_quantity.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;
  final Restaurant restaurant;
  const MyCartTile(
      {super.key, required this.cartItem, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, value, child) => Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      // food image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          cartItem.food.imagePath,
                          height: 100,
                          width: 100,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),

                      // name and price
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // food name
                          Text(cartItem.food.name),

                          // fiood price
                          Text("Rs." + cartItem.food.price.toString().trim())
                        ],
                      ),

                      // increments or decrement quantity
                      MyQuantitySelector(
                          quantity: cartItem.quantity,
                          food: cartItem.food,
                          onIncrement: () {
                            restaurant.addToCart(
                                cartItem.food, cartItem.selectedAddons);
                          },
                          onDecrement: () {
                            restaurant.removeFromCart(cartItem);
                          }),
                    ],
                  )
                ],
              ),
            ));
  }
}
