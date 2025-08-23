import 'package:flutter/material.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:fooddelivery/homeScreens/HomeScreens/fav.dart';
import 'package:fooddelivery/homeScreens/HomeScreens/menu.dart';

import '../ cart/cart.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    Menuu(),
    Fav(),
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: CircleNavBar(
        activeIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        height: 60,
        circleColor: Colors.amberAccent,
        color: Colors.amberAccent, // 👈 added color here

        activeIcons: [
          Icon(Icons.fastfood, color: Colors.black),
          Icon(Icons.favorite, color: Colors.black),
          Icon(Icons.shopping_cart, color: Colors.black),
        ],
        inactiveIcons: [
          Icon(Icons.fastfood, color: Colors.black54),
          Icon(Icons.favorite, color: Colors.black54),
          Icon(Icons.shopping_cart, color: Colors.black54),
        ],
      ),
    );
  }
}
