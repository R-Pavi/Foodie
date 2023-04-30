import 'dart:convert';
import 'package:http/http.dart' as http;




Future<List<dynamic>> fetchRecipes({int size = 20}) async {
  final url = Uri.parse('https://tasty.p.rapidapi.com/recipes/list?from=0&size=$size&tags=under_30_minutes');

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
    return recipes;
  } else {
    throw Exception('Failed to fetch recipes');
  }
}