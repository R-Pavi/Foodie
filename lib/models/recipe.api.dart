import 'dart:convert';
import 'package:foodie/models/food_list_model.dart';
import 'package:foodie/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  Future<FoodListModel> getRecipes() async {
    final url = Uri.parse(
        'https://tasty.p.rapidapi.com/recipes/list?from=0&size=34&tags=under_30_minutes');

    final response = await http.get(
      url,
      headers: {
        'x-rapidapi-key': '89380adc05msha92511974c1e9a6p1dc0d7jsn4ae23e1031ab',
        'x-rapidapi-host': 'tasty.p.rapidapi.com',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final recipes = data['results'];
      // log(response.body.toString());

      return FoodListModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch recipes');
    }
  }

  List<Recipe> parseRecipes(List<dynamic> recipesData) {
    final List<Recipe> recipes = [];

    for (final recipeData in recipesData) {

      final Recipe recipe = Recipe.fromJson(recipeData);


      recipes.add(recipe);
    }

    return recipes;
  }
}
