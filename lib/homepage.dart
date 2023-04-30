import 'package:flutter/material.dart';
import 'package:foodie/pages/auth_page.dart';
import 'package:foodie/search.dart';
import 'package:foodie/views/home.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'profile.dart';
import 'api.dart';
import 'details.dart';
import 'views/home.dart';

class RecipeHomePage extends StatefulWidget {
  const RecipeHomePage({Key? key}) : super(key: key);

  @override
  RecipeHomePageState createState() => RecipeHomePageState();
}

class RecipeHomePageState extends State<RecipeHomePage> {
  bool isLoggedIn = false;
  bool _isExpanded = false;

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: const Text('Recipes'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              },
              child: isLoggedIn
                  ? const CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Icon(Icons.person, color: Colors.white),
                    )
                  : ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AuthPage()),
                        );
                      },
                      child: const Text('Login/SignUp'),
                    ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Row(children: const [
            Padding(
              padding: EdgeInsets.only(top: 10.0, left: 10.0, bottom: 10),
              child: Text(
                "Wipe Your Drool and start cookin'...",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ]),
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.all(10.0),
                child:
                    Text("Categories", style: TextStyle(color: Colors.white)),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text("See All", style: TextStyle(color: Colors.white)),
              )
            ],
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return buildCard(
                    icon: Icons.egg,
                    text: "Breakfast",
                  );
                } else if (index == 1) {
                  return buildCard(
                    icon: Icons.rice_bowl,
                    text: "Lunch",
                  );
                } else if (index == 2) {
                  return buildCard(
                    icon: Icons.coffee,
                    text: "Snacks",
                  );
                } else if (index == 3) {
                  return buildCard(
                    icon: Icons.food_bank,
                    text: "Dinner",
                  );
                } else {
                  return buildCard(
                    icon: Icons.donut_small,
                    text: "Sweets",
                  );
                }
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children:  [
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text("Recipes", style: TextStyle(color: Colors.white)),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  child: const Text(
                    "See All",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                // const Spacer(),
                // Padding(
                //   padding: const EdgeInsets.only(right:8.0),
                //   child: AnimSearchBar(
                //     width: 390,
                //     textController: TextEditingController(),
                //     helpText: "Search",
                //     onSuffixTap: () {
                //       // Perform search action here
                //     },
                //     suffixIcon: const Icon(
                //       Icons.search,
                //       color: Colors.white,
                //     ),
                //     onSubmitted: (String) {},
                //   ),
                // ),
                const Spacer(),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  width: _isExpanded
                      ? MediaQuery.of(context).size.width * 0.95
                      : 50,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.grey[200],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: _isExpanded
                              ? TextField(
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Search...',
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SearchPage(),
                                      ),
                                    );
                                  },
                                )
                              : const Text(''),
                        ),
                      ),
                      InkWell(
                        onTap: _toggleExpand,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Icon(_isExpanded ? Icons.close : Icons.search),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          FutureBuilder<List<dynamic>>(
            future: fetchRecipes(size: 30),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final List<dynamic> recipes = snapshot.data!;
                return Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 10.0,
                    ),
                    itemCount: recipes.length,
                    itemBuilder: (context, index) {
                      final recipe = recipes[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  RecipeDetailsPage(recipe: recipe),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                              child: Image.network(
                                recipe['thumbnail_url'],
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              recipe['name'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
        ],
      ),
      bottomNavigationBar: const GNav(
          backgroundColor: Colors.black,
          color: Colors.white,
          activeColor: Colors.white,
          tabBackgroundColor: Colors.grey,
          gap: 8,
          padding: EdgeInsets.all(16),
          tabMargin: EdgeInsets.all(5),
          tabs: [
            GButton(icon: Icons.home, text: "Home"),
            GButton(
              icon: Icons.rice_bowl,
              iconColor: Colors.white,
              text: "Recipes",
            ),
            GButton(icon: Icons.favorite, text: "Favourites"),
            GButton(icon: Icons.book, text: "Tips"),
          ]),
    );
  }

  Widget buildCard({required IconData icon, required String text}) {
    return Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 10),
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey, width: 3)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.black),
              const SizedBox(height: 8),
              Text(
                text,
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ),
        ));
  }
}
