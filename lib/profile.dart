import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'app_bar.dart';
import 'bottom_nav.dart';
import 'landing.dart';

class ProfilePage extends StatelessWidget {
  final String? email;
  final String name;

  ProfilePage({super.key, required this.email}) : name = email!.split('@')[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: 'Profile Page',
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/landing.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.5,
            alignment: Alignment.center,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: ClipRRect(                        
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset('assets/images/profile_pic.png'),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Name: ${name.toUpperCase()}"), // Display the name
                    Text('Email: $email'),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 250,
                      child: ElevatedButton(
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RecipeLandingPage()),
                          );
                        },
                        child: const Text("Logout"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      
      bottomNavigationBar: const MyGNav(initialIndex: 0),
    );
  }
}
