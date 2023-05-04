import 'package:flutter/material.dart';
import 'package:foodie/views/home.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
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
  bool isLoggedIn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  const MyAppBar(
        title: 'Recipe',
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
              ),
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
