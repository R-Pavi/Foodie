import 'package:foodie/views/widgets/recipe_card.dart';
import 'package:flutter/material.dart';

class RecipeDetail extends StatelessWidget {
  final String name;
  final String thumbnail_url;
  // final double user_ratings;
  final String cook_time_minutes;
  final String description;
  final String user_ratings;
  final String videoUrl;

  RecipeDetail(
      {required this.name,
      required this.thumbnail_url,
      required this.cook_time_minutes,
      required this.description,
      required this.user_ratings,
      required this.videoUrl});

  factory RecipeDetail.fromJson(dynamic json) {
    return RecipeDetail(
        name: json['name'] as String,
        thumbnail_url: json['thumbnail_url'][0]['hostedLargeUrl'] as String,
        user_ratings: json['user_ratings'].toString(),
        cook_time_minutes: json['cook_time_minutes'].toString(),
        description: json['description'] != null ? json['description'] : " ",
        videoUrl: json['original_video_url'] != null? json['original_video_url'] : " ",
        
        );
  
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
      body: SafeArea(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          RecipeCard(
              name: name,
              cook_time_minutes: cook_time_minutes,
              thumbnail_url: thumbnail_url,
              user_ratings: user_ratings,
              videoUrl: videoUrl),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Description',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    description,
                    style: TextStyle(color: Colors.black, fontSize: 14),
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
