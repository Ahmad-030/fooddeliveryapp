import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/homeScreens/CART.dart';
import 'package:fooddelivery/homeScreens/Orders.dart';
import 'package:fooddelivery/homeScreens/menu.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final _controller = NotchBottomBarController(index: 0);

  int _currentIndex = 0; // 👈 track current tab

  final List<Widget> _pages = const [
    Menuu(),
    CartPage(),
    Orders(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // so notch floats above body
      body: _pages[_currentIndex], // 👈 use _currentIndex here
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: _controller,
        color: Colors.white.withOpacity(0.15),
        showLabel: true,
        notchColor: Colors.amberAccent,
        durationInMilliSeconds: 300,
        kBottomRadius: 28.0,
        kIconSize: 26.0,

        bottomBarItems: const [BottomBarItem(
          inActiveItem: Center(child: Icon(Icons.fastfood, color: Colors.white70)),
          activeItem: Center(child: Icon(Icons.fastfood, color: Colors.white)),
          itemLabel: 'Menu',
        ),
          BottomBarItem(
            inActiveItem: Center(child: Icon(Icons.favorite, color: Colors.white70)),
            activeItem: Center(child: Icon(Icons.favorite, color: Colors.white)),
            itemLabel: 'Favourite',
          ),
          BottomBarItem(
            inActiveItem: Center(child: Icon(Icons.shopping_cart, color: Colors.white70)),
            activeItem: Center(child: Icon(Icons.shopping_cart, color: Colors.white)),
            itemLabel: 'Cart',


          ),

        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index; // 👈 update current index
          });
        },
      ),
    );
  }
}
