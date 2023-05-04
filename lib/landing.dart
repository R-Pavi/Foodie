import 'package:flutter/material.dart';
import 'package:foodie/homepage.dart';
import 'package:foodie/pages/auth_page.dart';
import 'package:carousel_slider/carousel_slider.dart';

// final List<String> imgList = [
//   'assets/images/landingpg1.jpeg',
//   'assets/images/landingpg2.jpeg',
//   'assets/images/landingpg3.jpeg',
//   'assets/images/landingpg4.jpeg',
//   'assets/images/landingpg5.jpeg',
// ];

class RecipeLandingPage extends StatelessWidget {
  const RecipeLandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.zero,
        child: SafeArea(
          child: Scaffold(
            body: Stack(
              children: [
                Positioned.fill(
                  child: Opacity(
                    opacity: 0.5,
                    child: Image.asset(
                      'assets/images/landing.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned.fill(
                  top:-160,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 450,
                      autoPlay: true,
                      enlargeCenterPage: true,
                    ),
                    items: const [
                      'assets/images/landingpg1.jpeg',
                      'assets/images/landingpg2.jpeg',
                      'assets/images/landingpg3.jpeg',
                      'assets/images/landingpg4.jpeg',
                      'assets/images/landingpg5.jpeg',
                    ].map((imagePath) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.red,
                            width: 4,
                          ),
                        ),
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom:8.0),
                        child: Text(
                          "Foodology",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom:5.0),
                        child: Text(
                          "Digitalize your recipe book",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 30.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const AuthPage()),
                                  );
                                },
                                child: const Text('Log in'),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const AuthPage()),
                                  );
                                },
                                child: const Text('Sign Up'),
                              ),
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RecipeHomePage()),
                          );
                        },
                        child: const Text('Skip for now',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
