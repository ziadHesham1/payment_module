import 'package:flutter/material.dart';

import 'core/app_theme.dart';
import 'features/cart/cart_screen.dart';
import 'features/home/home_screen.dart';
import 'features/more/profile/profile_screen.dart';

class AppNavbar extends StatefulWidget {
  const AppNavbar({super.key});

  @override
  State<AppNavbar> createState() => _AppNavbarState();
}

class _AppNavbarState extends State<AppNavbar> {
  int tabIndex = 2;
  @override
  Widget build(BuildContext context) {
    var screens = [
      const HomeScreen(),
      const CartScreen(),
      const ProfileScreen(),
    ];
    var tabs = [
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart),
        label: 'Cart',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Profile',
      ),
    ];
    return Scaffold(
        body: screens[tabIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: tabIndex,
          backgroundColor: const Color(0xffff6f6f6),
          selectedItemColor: AppColors.primary,
          onTap: (value) {
            setState(() {
              tabIndex = value;
            });
          },
          items: tabs,
        ));
  }
}
