// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class RecipeCarousel extends StatefulWidget {
//   @override
//   _RecipeCarouselState createState() => _RecipeCarouselState();
// }

// class _RecipeCarouselState extends State<RecipeCarousel> {
//   List<dynamic> recipes = [];

//   Future<void> getRecipes() async {
//     var url =
//         Uri.parse('https://tasty.p.rapidapi.com/recipes/list?from=0&size=4');
//     var response = await http.get(url, headers: {
//       'x-rapidapi-key': '8bfbd4eabamsh6042655d9dbc09cp14ad62jsn92d93d57f8df',
//       'x-rapidapi-host': 'tasty.p.rapidapi.com',
//       'Content-Type': 'application/json'
//     });

//     if (response.statusCode == 200) {
//     setState(() {
//       recipes = jsonDecode(response.body)['results'];
//     });
//     print(response.body); // logging the response body
//   } else {
//     print('Request failed with status: ${response.statusCode}.');
//   }
// }

//   @override
//   void initState() {
//     super.initState();
//     getRecipes();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 200,
//       child: ListView.builder(
//         scrollDirection: Axis.vertical,
//         itemCount: recipes.length,
//         itemBuilder: (context, index) {
//           return Container(
//             height: 270,
//             width: 150,
//             margin: EdgeInsets.symmetric(horizontal: 30),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [

//  Text(
//                   recipes[index]['name'],
//                   style: TextStyle(fontSize: 16, color: Colors.white),
//                 ),
//                                 SizedBox(height: 10),

//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(8.0),
//                   child: Image.network(
//                     recipes[index]['thumbnail_url'],
//                     height: 200,
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                   ),
//                 ),

//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RecipeCarousel extends StatefulWidget {
  @override
  _RecipeCarouselState createState() => _RecipeCarouselState();
}

class _RecipeCarouselState extends State<RecipeCarousel> {
  List<dynamic> recipes = [];

  Future<void> getRecipes() async {
    var url =
        Uri.parse('https://tasty.p.rapidapi.com/recipes/list?from=0&size=4');
    var response = await http.get(url, headers: {
      'x-rapidapi-key': '8bfbd4eabamsh6042655d9dbc09cp14ad62jsn92d93d57f8df',
      'x-rapidapi-host': 'tasty.p.rapidapi.com',
      'Content-Type': 'application/json'
    });

    if (response.statusCode == 200) {
      setState(() {
        recipes = jsonDecode(response.body)['results'];
      });
      print(response.body); // logging the response body
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  void _navigateToRecipeDetailPage(dynamic recipe) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecipeDetailPage(recipe: recipe),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _navigateToRecipeDetailPage(recipes[index]),
            child: Container(
              height: 270,
              width: 150,
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipes[index]['name'],
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      recipes[index]['thumbnail_url'],
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class RecipeDetailPage extends StatelessWidget {
  final dynamic recipe;

  RecipeDetailPage({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(recipe['name']),
        ),
        body: Container(
            padding: EdgeInsets.all(20.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  recipe['thumbnail_url'],
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Ingredients:',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              Expanded(
                child: ListView.builder(
                  itemCount: recipe['sections'][0]['components'].length,
                  itemBuilder: (context, index) {
                    return Text(
                      recipe['sections'][0]['components'][index]['raw_text'],
                      style: TextStyle(fontSize: 16.0),
                    );
                  },
                ),
              )
            ])));
  }
}
