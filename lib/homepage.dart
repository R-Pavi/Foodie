import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:foodie/models/recipe.dart';
import 'package:foodie/pages/auth_page.dart';
import 'package:foodie/recipe_carousel.dart';
import 'package:foodie/search.dart';
import 'package:foodie/views/home.dart';
import 'package:foodie/views/tips_detail.dart';
import 'package:foodie/views/widgets/recipe_card.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'profile.dart';
import 'api.dart';
import 'details.dart';
import 'views/home.dart';
import 'package:foodie/models/feed.api.dart';
import 'package:http/http.dart' as http;

import 'package:foodie/models/food_list_model.dart';
import 'package:foodie/models/recipe.api.dart';
import 'package:foodie/recipe_carousel.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'app_bar.dart';
import 'categories.dart';
import 'filtered.dart';



class RecipeHomePage extends StatefulWidget {
  const RecipeHomePage({Key? key}) : super(key: key);

  @override
  RecipeHomePageState createState() => RecipeHomePageState();
}

class RecipeHomePageState extends State<RecipeHomePage> {

 
  bool _isExpanded = false;

  late FoodListModel _foodList;
  bool _isLoading = true;
  final recipeApi = RecipeApi(); // create an instance of RecipeApi

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _foodList = await recipeApi.getRecipes(); // call getRecipes on the instance
    setState(() {
      _isLoading = false;
    });
  }

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  bool isLoggedIn = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  const MyAppBar(
        title: 'Recipe',
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
      body: Column(children: [
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
      body: Column(
        children: [
          Row(children: const [

            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("Categories", style: TextStyle(color: Colors.white)),
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
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text("Recipes", style: TextStyle(color: Colors.white)),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                child: const Text(
                  "See All",
                  style: TextStyle(color: Colors.white),

          ]),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(10.0),
                child:
                    Text("Categories", style: TextStyle(color: Colors.white)),
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
                      MaterialPageRoute(
                          builder: (context) => const Categories()),
                    );
                  },
                ),
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
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FilteredPage(
                                    tag: 'under_30_minutes',
                                  )));
                    },
                    child: buildCard(
                      icon: FontAwesomeIcons.utensils,
                      text: "Under 30",
                    ),
                  );
                } else if (index == 1) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FilteredPage(
                                    tag: 'brunch',
                                  )));
                    },
                    child: buildCard(
                      icon: FontAwesomeIcons.breadSlice,
                      text: "Brunch",
                    ),
                  );
                } else if (index == 2) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FilteredPage(
                                    tag: 'breakfast',
                                  )));
                    },
                    child: buildCard(
                      icon: FontAwesomeIcons.egg,
                      text: "Breakfast",
                    ),
                  );
                } else if (index == 3) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FilteredPage(
                                    tag: 'lunch',
                                  )));
                    },
                    child: buildCard(
                      icon: FontAwesomeIcons.bowlRice,
                      text: "Lunch",
                    ),
                  );
                } else {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FilteredPage(
                                    tag: 'vegan',
                                  )));
                    },
                    child: buildCard(
                      icon: FontAwesomeIcons.carrot,
                      text: "Vegan",
                    ),
                  );
                }
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
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
        Flexible(
          child: SingleChildScrollView(

            child: SizedBox(height: 250,
              child: RecipeCarousel()),
          ),
        ),
        
      ]),
            ],
          ),
        ],
      ),

      bottomNavigationBar: GNav(
          backgroundColor: Colors.black,
          color: Colors.white,
          activeColor: Colors.white,
          tabBackgroundColor: Colors.grey,
          gap: 8,
          padding: const EdgeInsets.all(16),
          tabMargin: const EdgeInsets.all(5),
          tabs: [
            GButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RecipeHomePage()),
                  );
                },
                icon: Icons.home,
                text: "Home"),
            const GButton(
              icon: Icons.rice_bowl,
              iconColor: Colors.white,
              text: "Recipes",
            ),
            GButton(icon: Icons.favorite, text: "Favourites"),
            GButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) =>  TipsDetailsScreen()),
                  // );
                },
                icon: Icons.book,
                text: "Tips"),

            const GButton(icon: Icons.favorite, text: "Favourites"),
            const GButton(icon: Icons.book, text: "Tips"),
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
