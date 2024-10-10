import 'package:flutter/material.dart';
import 'package:flutter_challenge/days/day%2018/food_page.dart';
import 'package:flutter_challenge/days/day%2018/models/food.dart';
import 'package:flutter_challenge/days/day%2018/models/restaurant.dart';
import 'package:flutter_challenge/utils/my_current_location.dart';
import 'package:flutter_challenge/utils/my_description_box.dart';
import 'package:flutter_challenge/utils/my_food_tile.dart';
import 'package:flutter_challenge/utils/my_silver_app_bar.dart';
import 'package:flutter_challenge/utils/my_tab_bar.dart';
import 'package:flutter_challenge/utils/mydrawer.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeDash extends StatefulWidget {
  const HomeDash({super.key});

  @override
  State<HomeDash> createState() => _HomeDashState();
}

class _HomeDashState extends State<HomeDash>
    with SingleTickerProviderStateMixin {
  // tab controller
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

// sort out a d return a list of food items that belong to a specific category
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }
// return list of foods in given  category

  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      // get category menu
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return ListView.builder(
          itemCount: categoryMenu.length,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            // get individual  food
            final food = categoryMenu[index];

            // return food tile UI
            return MyFoodTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FoodPage(
                        food: food,
                        selectedAddons: const {},
                      ),
                    ),
                  );

                  // context.go('/food_page');
                },
                food: food);
            // ListTile(
            //   title: Text(categoryMenu[index].name),
            // );
          });
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text(
      //     'D A S H B O A R D',
      //     style: TextStyle(
      //       color: Theme.of(context).colorScheme.inversePrimary,
      //     ),
      //   ),
      //   // leading: IconButton(
      //   //     onPressed: () {
      //   //       // Navigator.pop(context);
      //   //       context.go('/login_user');
      //   //     },
      //   //     icon: Icon(
      //   //       Icons.arrow_back,
      //   //       color: Theme.of(context).colorScheme.inversePrimary,
      //   //     )),
      // ),
      drawer: const Mydrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySilverAppBar(
            title: MyTabBar(tabController: _tabController),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),

                // ,my surrent location
                const MyCurrentLocation(),

                // description box
                const MyDescriptionBox(),
              ],
            ),
          ),
        ],
        body: Consumer<Restaurant>(
            builder: (context, restaurant, child) =>
                TabBarView(controller: _tabController, children: [
                  ...getFoodInThisCategory(restaurant.menu),
                  //   ListView.builder(
                  //     itemCount: 5,
                  //     itemBuilder: (context, index) => Text("first tab items"),
                  //   ),
                  //   ListView.builder(
                  //     itemCount: 5,
                  //     itemBuilder: (context, index) => Text("second tab items"),
                  //   ),
                  //   ListView.builder(
                  //     itemCount: 5,
                  //     itemBuilder: (context, index) => Text("third tab items"),
                  //   ),
                  //   ListView.builder(
                  //     itemCount: 5,
                  //     itemBuilder: (context, index) => Text("second tab items"),
                  //   ),
                  //   ListView.builder(
                  //     itemCount: 5,
                  //     itemBuilder: (context, index) => Text("third tab items"),
                  //   ),
                ])),
      ),
    );
  }
}
