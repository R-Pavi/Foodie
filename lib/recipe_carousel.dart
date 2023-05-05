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
                    onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FeedDetail(
                                    name: _foodList.results?[index]?.name ??
                                        'No data available',
                                    cook_time_minutes: _foodList
                                            .results?[index]?.cookTimeMinutes
                                            ?.toString() ??
                                        '',
                                    thumbnail_url: _foodList
                                            .results?[index]?.thumbnailUrl ??
                                        'No data available',
                                    description: _foodList
                                            .results?[index]?.description ??
                                        'No data available',
                                    servings: _foodList
                                            .results?[index]?.numServings
                                            ?.toString() ??
                                        'No data available',
                                    rawText: _foodList.results?[index]?.sections
                                            ?.first?.components
                                            ?.map((component) =>
                                                component.rawText)
                                            ?.toList()
                                            ?.toString() ??
                                        'No data available',
                                    instructions: _foodList.results?[index]
                                                ?.instructions !=
                                            null
                                        ? _foodList.results![index]
                                                .instructions![0].displayText ??
                                            'No data available'
                                        : 'No data available',
                                    videoUrl:
                                        _foodList.results?[index]?.videoUrl ??
                                            'No data available',
                                  )))
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
