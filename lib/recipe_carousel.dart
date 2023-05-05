import 'package:foodie/models/food_list_model.dart';
import 'package:foodie/feed_detail.dart';
import 'package:flutter/material.dart';
import 'package:foodie/models/feed.api.dart';
import 'package:foodie/models/recipe.dart';
import 'package:foodie/views/widgets/feed_card.dart';
import 'package:foodie/views/widgets/feed_card.dart';
import 'package:carousel_slider/carousel_slider.dart';

class RecipeCarousel extends StatefulWidget {
  @override
  _RecipeCarouselState createState() => _RecipeCarouselState();
}

class _RecipeCarouselState extends State<RecipeCarousel> {
  late FoodListModel _foodList;
  bool _isLoading = true;

  List<dynamic> recipes = [];
  final recipeApi = FeedApi(); // create an instance of RecipeApi

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
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: _foodList.results!.length,
              itemBuilder: (context, index) {
                if (index < _foodList.results!.length) {
                  return GestureDetector(
                    child: FeedCard(
                        name: _foodList.results![index].name ?? '',
                        thumbnail_url: _foodList.results![index].thumbnailUrl,
                        videoUrl: _foodList.results![index].videoUrl),
                    onTap: () => {},
                  );
                } else {
                  return SizedBox.shrink(); // or any placeholder widget
                }
              },
            ),
    );
  }
}
