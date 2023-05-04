import 'package:flutter/material.dart';
import 'package:foodie/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'landing.dart';




void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );  
   runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foodology',
      theme: ThemeData(
          primarySwatch: Colors.red, scaffoldBackgroundColor: Colors.black),
      home: const RecipeLandingPage(),
     );
  }
}




