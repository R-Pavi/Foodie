import 'package:flutter/material.dart';
import 'package:foodie/bottom_nav.dart';



class RecipeDetailsPage extends StatefulWidget {
  final dynamic recipe;

  const RecipeDetailsPage({super.key, required this.recipe});

  @override
  RecipeDetailsPageState createState() => RecipeDetailsPageState();
}

class RecipeDetailsPageState extends State<RecipeDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe['name']),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
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
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.recipe['description'],
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const MyGNav(initialIndex: 0)
    );
  }
}
