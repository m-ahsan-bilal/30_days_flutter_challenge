import 'package:flutter/material.dart';
import 'package:flutter_challenge/days/day%20eleven/navFavorite.dart';
import 'package:flutter_challenge/days/day%20eleven/navHome.dart';
import 'package:flutter_challenge/days/day%20eleven/navProfile.dart';
import 'package:flutter_challenge/days/day%20eleven/navSearch.dart';
import 'package:go_router/go_router.dart';

class DayEleven extends StatefulWidget {
  const DayEleven({super.key});

  @override
  State<DayEleven> createState() => _DayElevenState();
}

class _DayElevenState extends State<DayEleven> {
  void onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final pageController = PageController(initialPage: 0);
  late int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.go('/');
            },
            icon: const Icon(Icons.arrow_back)),
        title: Text(
          'Day 11',
          style: TextStyle(color: Colors.lightGreen.shade400),
        ),
        centerTitle: true,
      ),
      extendBody: true,
      body: PageView(
        controller: pageController,
        children: const [
          Center(
            child: Home(),
          ),
          Center(
            child: Favorite(),
          ),
          Center(
            child: Search(),
          ),
          Center(
            child: Profile(),
          ),
        ],
      ),
      // floatingActionButtonLocation:
      //     FloatingActionButtonLocation.miniCenterDocked,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   shape: const CircleBorder(),
      //   child: Icon(Icons.add),
      // ),
      bottomNavigationBar:
          //  BottomAppBar(
          //   shape: const CircularNotchedRectangle(),
          //   notchMargin: 10.0,
          //   clipBehavior: Clip.antiAlias,
          //   child:

          BottomNavigationBar(
        onTap: onTabTapped,
        // landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.deepOrange,
        useLegacyColorScheme: true,
        // EditableText.debugDeterministicCursor,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        // onTap: (index) {
        //   setState(() {
        //     _selectedIndex = index;
        //     pageController.jumpToPage(index);
        //   });
        // },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Profile',
          ),
        ],
      ),
      // ),
    );
  }
}
