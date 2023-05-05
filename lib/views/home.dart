import 'package:foodie/models/food_list_model.dart';
import 'package:foodie/views/recipe_detail.dart';
import 'package:flutter/material.dart';
import 'package:foodie/models/recipe.api.dart';
import 'package:foodie/views/widgets/recipe_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FoodListModel _foodList;
  bool _isLoading = true;

  final recipeApi = RecipeApi(); // create an instance of RecipeApi

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _foodList = await recipeApi.getRecipes(); // call getRecipes on the instance
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
              itemCount: _foodList.results!.length,
              itemBuilder: (context, index) {
                if (index < _foodList.results!.length) {
                  return GestureDetector(
                    child: RecipeCard(
                        name: _foodList.results![index].name ?? '',
                        cook_time_minutes: _foodList
                            .results![index].cookTimeMinutes
                            .toString(),
                        thumbnail_url: _foodList.results![index].thumbnailUrl,
                        videoUrl: _foodList.results![index].videoUrl),
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecipeDetail(
                            name: _foodList.results![index].name ?? '',
                            cook_time_minutes: _foodList
                                .results![index].cookTimeMinutes
                                .toString(),
                            thumbnail_url:
                                _foodList.results![index].thumbnailUrl,
                            description:
                                _foodList.results![index].description ?? '',
                            servings: _foodList.results![index].numServings
                                .toString(),
                            rawText: _foodList
                                .results![index].sections!.first.components!
                                .map((component) => component.rawText)
                                .toList()
                                .toString(),
                            instructions:
                                _foodList.results![index].instructions != null
                                    ? _foodList.results![index].instructions![0]
                                            .displayText ??
                                        ''
                                    : '',
                            videoUrl: _foodList.results![index].videoUrl,
                          ),
                        ),
                      )
                    },
                  );
                } else {
                  return SizedBox.shrink(); // or any placeholder widget
                }
              },
            ),
    );
  }
}
