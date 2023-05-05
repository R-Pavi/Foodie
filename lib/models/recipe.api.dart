import 'dart:convert';
import 'package:foodie/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  Future<List<Recipe>> getRecipes() async {
    final url = Uri.parse(
        'https://tasty.p.rapidapi.com/recipes/list?from=0&size=34&tags=under_30_minutes');

    final response = await http.get(
      url,
      headers: {
        'x-rapidapi-key': '42143c4529msh775bf56921b4018p14d05ejsnb083e1f619fd',
        'x-rapidapi-host': 'tasty.p.rapidapi.com',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final recipes = data['results'] as List<dynamic>;
      return parseRecipes(recipes);
    } else {
      throw Exception('Failed to fetch recipes');
    }
  }

  List<Recipe> parseRecipes(List<dynamic> recipesData) {
    final List<Recipe> recipes = [];

    for (final recipeData in recipesData) {
      final Recipe recipe = Recipe(
          // id: recipeData['id'],
          name: recipeData['name'],
          thumbnail_url: recipeData['thumbnail_url'],
          cook_time_minutes: recipeData['cook_time_minutes'].toString(),
          description: recipeData['description'],
          user_ratings: recipeData['user_ratings'].toString(),
          videoUrl: recipeData['original_video_url'] != null
              ? recipeData['original_video_url'].toString()
              : ''

// user_ratings: double.parse(recipeData['user_ratings']['average']),
          // servings: recipeData['num_servings'],
          // ingredients: recipeData['sections'][0]['components']
          //     .map((componentData) => componentData['raw_text'])
          //     .toList(),
          // instructions: recipeData['instructions']
          //     .map((instructionData) => instructionData['display_text'])
          //     .toList(),
          );

      recipes.add(recipe);
    }

    return recipes;
  }
}
