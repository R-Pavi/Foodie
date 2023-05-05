import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchRecipes({int size = 20, required String tag}) async {
  final url = Uri.parse('https://tasty.p.rapidapi.com/recipes/list?from=0&size=$size&tags=$tag');
  final response = await http.get(
    url,
    headers: {
      'x-rapidapi-key': '89380adc05msha92511974c1e9a6p1dc0d7jsn4ae23e1031ab',
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
