import 'package:flutter/material.dart';
import 'package:foodie/search.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'homepage.dart';
import 'views/home.dart';

class MyGNav extends StatelessWidget {
  final int initialIndex; // Add this parameter

  const MyGNav({Key? key, required this.initialIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GNav(
      backgroundColor: Colors.black,
      color: Colors.white,
      activeColor: Colors.red,
      tabBackgroundColor: Color.fromARGB(255, 214, 210, 210), 
      gap: 8,
      padding: const EdgeInsets.all(16),
      tabMargin: const EdgeInsets.all(5),
      selectedIndex: initialIndex, // Use the initial index here
      tabs: [
        GButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RecipeHomePage()),
            );
          },
          icon: Icons.home,
          text: "Home",
        ),
        GButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
          icon: Icons.rice_bowl,
          iconColor: Colors.white,
          text: "Recipes",
        ),
         
        GButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SearchPage()),
            );
          },
          icon: Icons.search,
          text: "Search",
        ),
      ],
      
    );
  }
}
