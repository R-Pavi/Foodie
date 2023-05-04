import 'package:flutter/material.dart';
import 'package:foodie/details.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  final _searchController = TextEditingController();
  List<dynamic> _searchResults = [];
  bool _isLoading = false;

  Future<List<dynamic>> _searchTastyAPI(String query, {int size = 20}) async {
    final url = Uri.parse(
        'https://tasty.p.rapidapi.com/recipes/list?from=0&size=$size&q=$query');

    final response = await http.get(
      url,
      headers: {
        'x-rapidapi-key': 'b28101f78bmsh806710711052f4bp1d477ejsnbb725ff3165f',
        'x-rapidapi-host': 'tasty.p.rapidapi.com',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final recipes = data['results'] as List<dynamic>;
      return recipes;
    } else {
      throw Exception('Failed to search for recipes');
    }
  }

  void _handleSearch() async {
    setState(() {
      _isLoading = true;
    });

    final results = await _searchTastyAPI(_searchController.text);
    setState(() {
      _searchResults = results;
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Recipe'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        hintStyle: const TextStyle(color: Colors.grey),
                        hintText: 'Search for recipes',
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.search),
                              color: Colors.white,
                              onPressed: _handleSearch,
                            ),
                            IconButton(
                              icon: const Icon(Icons.clear),
                              color: Colors.white,
                              onPressed: () => _searchController.clear(),
                            ),
                          ],
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                      onSubmitted: (value) {
                        _handleSearch();
                      },
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _searchResults.length,
                      itemBuilder: (context, index) {
                        final recipe = _searchResults[index];
                        return ListTile(
                          leading: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Container(
                                height: 250,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 3)),
                                child: Image.network(
                                  recipe['thumbnail_url'],
                                  fit: BoxFit.cover,
                                  height: 200,
                                  width: 50,
                                )),
                          ),
                          title: Text(recipe['name'],
                              style: const TextStyle(color: Colors.white)),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RecipeDetailsPage(
                                        recipe: recipe,
                                      )),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
