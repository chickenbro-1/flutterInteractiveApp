import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  final void Function(int)? onTabChange;

  MyBottomNavBar({
    super.key,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3), // Shadow position
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: GNav(
          onTabChange: (value) => onTabChange!(value),
          color: Colors.grey[600], // Unselected icon and text color
          activeColor: Colors.white, // Selected icon and text color
          iconSize: 24,
          gap: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          tabBackgroundColor: Color(0xFF00754A), // Background color for selected tab
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          tabBorderRadius: 24,
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Shop',
              iconSize: 26, // Increase icon size
              textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,color: Colors.white),
            ),
            GButton(
              icon: Icons.shopping_bag_outlined,
              text: 'Cart',
              iconSize: 26,
              textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
