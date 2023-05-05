import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/bottom_nav.dart';
import 'app_bar.dart';
import 'filtered.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: 'Categories',
       
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 700,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 7,
            itemBuilder: (context, index) {
              if (index == 0) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            FilteredPage(tag: 'under_30_minutes'),
                      ),
                    );
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
              } else if (index == 4) {
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
              } else if (index == 5) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FilteredPage(
                                  tag: 'dinner',
                                )));
                  },
                  child: buildCard(
                    icon: FontAwesomeIcons.spaghettiMonsterFlying,
                    text: "Dinner",
                  ),
                );
              } else {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FilteredPage(
                                  tag: 'drinks',
                                )));
                  },
                  child: buildCard(
                    icon: FontAwesomeIcons.wineBottle,
                    text: "Drinks",
                  ),
                );
              }
            },
          ),
        ),
      ),
           bottomNavigationBar: const MyGNav(initialIndex: 0),
    );
  }

  Widget buildCard({required IconData icon, required String text}) {
    return Padding(
        padding: const EdgeInsets.all(10),
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
