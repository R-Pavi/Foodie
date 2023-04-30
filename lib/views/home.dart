import 'package:foodie/views/recipe_detail.dart';
import 'package:flutter/material.dart';
import 'package:foodie/models/recipe.api.dart';
import 'package:foodie/models/recipe.dart';
import 'package:foodie/views/widgets/recipe_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Recipe> _recipes;
  bool _isLoading = true;

  final recipeApi = RecipeApi(); // create an instance of RecipeApi

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await recipeApi.getRecipes(); // call getRecipes on the instance
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.restaurant_menu),
              SizedBox(width: 10),
              Text('Food Recipe')
            ],
          ),
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _recipes.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: RecipeCard(
                        name: _recipes[index].name,
                        cook_time_minutes: _recipes[index].cook_time_minutes,
                        user_ratings: _recipes[index].user_ratings.toString(),
                        thumbnail_url: _recipes[index].thumbnail_url,
                        videoUrl: _recipes[index].videoUrl),
                onTap: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeDetail(
                      name: _recipes[index].name,
                        cook_time_minutes: _recipes[index].cook_time_minutes,
                        user_ratings: _recipes[index].user_ratings.toString(),
                        thumbnail_url: _recipes[index].thumbnail_url,
                      description: _recipes[index].description,
                      videoUrl: _recipes[index].videoUrl),
                  ),)
                },
                  );
                },
              ));
  }
}
