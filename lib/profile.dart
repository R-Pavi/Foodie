import 'package:flutter/material.dart';

import 'app_bar.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Profile Page',),
      
      // AppBar(
      //   leading: IconButton(
      //     icon: const Icon(Icons.menu),
      //     onPressed: () {},
      //   ),
      //   title: const Text('Recipes'),
      //   actions: const <Widget>[
      //     Padding(
      //       padding: EdgeInsets.only(right: 8.0),
      //       child: CircleAvatar(
      //         backgroundColor: Colors.transparent,
      //         child: Icon(Icons.person, color: Colors.white),
      //       ),
      //     )
      //   ],
      // ),
      body: SizedBox(
  width: 300,
  height: 300,
  child: Center(
    child: Container(
      alignment: Alignment.center,
      color: Colors.pink,
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
                  child: const Icon(Icons.woman),
                ),
              ),
              const SizedBox(height: 10,),
              const Text("User 1"),
              const Text("user1@gmail.com"),
              const SizedBox(height: 10,),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () { },
                  child: const Text("Edit Profile"),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  ),
),


    );
  }
}
