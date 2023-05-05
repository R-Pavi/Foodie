import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class RecipeDetailsPage extends StatefulWidget {
  final dynamic recipe;

  RecipeDetailsPage({required this.recipe});

  @override
  _RecipeDetailsPageState createState() => _RecipeDetailsPageState();
}

class _RecipeDetailsPageState extends State<RecipeDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe['name']),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 2,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.network(
                      widget.recipe['thumbnail_url'],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Positioned(
                  top: 5,
                  right: 5,
                  child: Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            widget.recipe['name'],
            style: const TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.recipe['description'],
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const GNav(
          backgroundColor: Colors.black,
          color: Colors.white,
          activeColor: Colors.white,
          tabBackgroundColor: Colors.grey,
          gap: 8,
          padding: EdgeInsets.all(16),
          tabMargin: EdgeInsets.all(5),
          tabs: [
            GButton(icon: Icons.home, text: "Home"),
            GButton(
              icon: Icons.rice_bowl,
              iconColor: Colors.white,
              text: "Search",
            ),
            GButton(icon: Icons.favorite, text: "Favourites"),
            GButton(icon: Icons.book, text: "Tips"),
          ]),
    );
  }
}
