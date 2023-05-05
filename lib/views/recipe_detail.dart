import 'package:foodie/app_bar.dart';
import 'package:foodie/bottom_nav.dart';
import 'package:foodie/models/recipe.dart';
import 'package:foodie/views/widgets/recipe_card.dart';
import 'package:flutter/material.dart';

class RecipeDetail extends StatelessWidget {
  final String name;
  final String? thumbnail_url;
  final String cook_time_minutes;
  final String description;
  final String? videoUrl;
  final String servings;
  final String instructions;
  final String rawText;

  RecipeDetail({
    required this.name,
    this.thumbnail_url,
    required this.cook_time_minutes,
    required this.description,
    this.videoUrl,
    required this.servings,
    required this.instructions,
    required this.rawText,
  });

  factory RecipeDetail.fromJson(dynamic json) {
    return RecipeDetail(
      name: json['name'] as String,
      thumbnail_url: json['thumbnail_url'][0]['hostedLargeUrl'] as String,
      cook_time_minutes: json['cook_time_minutes'].toString(),
      servings: json['num_servings'].toString(),
      description: json['description'] ?? " ",
      videoUrl: json['original_video_url'] ?? " ",
      instructions: json['instructions']
          .map((instructionData) => instructionData['display_text'])
          .toList(),
      rawText: json['sections'][0]['components'][4]['raw_text'],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Food Recipe'),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            RecipeCard(
                name: name,
                cook_time_minutes: cook_time_minutes,
                thumbnail_url: thumbnail_url,
                // user_ratings: user_ratings,
                videoUrl: videoUrl),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Name',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          name,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 14),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Description',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        description,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Servings',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        servings,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Ingredients',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        rawText,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Instructions',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        instructions,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        )),
      ),
      bottomNavigationBar: const MyGNav(initialIndex: 0,),
    );
  }
}
