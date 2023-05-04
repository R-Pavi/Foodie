import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:foodie/models/feed.dart';

Future<List<Recipe>> fetchFeedList() async {
  // Call the API to fetch the feed data
  final response = await http.get(
    Uri.parse('https://tasty.p.rapidapi.com/feeds/list'),
    headers: {
      'x-rapidapi-host': 'tasty.p.rapidapi.com',
      'x-rapidapi-key': 'YOUR_API_KEY_HERE',
    },
  );
  if (response.statusCode == 200) {
    // Parse the response and return the list of recipes
    final List<dynamic> data = jsonDecode(response.body)['results'];
    final List<Recipe> recipes = data.map((item) => Recipe.fromJson(item)).toList();
    return recipes;
  } else {
    // Throw an exception if the request failed
    throw Exception('Failed to fetch feed data');
  }
}
