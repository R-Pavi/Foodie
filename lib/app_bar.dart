import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'pages/auth_page.dart';
import 'profile.dart';
import 'search.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  _MyAppBarState createState() => _MyAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MyAppBarState extends State<MyAppBar> {
  bool isLoggedIn = false;

  void _updateAuthStatus() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        setState(() {
          isLoggedIn = true;
        });
      } else {
        setState(() {
          isLoggedIn = false;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _updateAuthStatus();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.search),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SearchPage()),
          );
        },
      ),
      title: Text(widget.title),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: isLoggedIn
              ? DropdownButton(
                  icon: const Icon(Icons.person, color: Colors.white),
                  items: const [
                    DropdownMenuItem(
                      value: 'profile',
                      child: Text('Profile'),
                    ),
                    DropdownMenuItem(
                      value: 'logout',
                      child: Text('Logout'),
                    ),
                  ],
                  onChanged: (value) {
                    if (value == 'profile') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfilePage(),
                        ),
                      );
                    } else if (value == 'logout') {
                      FirebaseAuth.instance.signOut();
                      setState(() {
                        isLoggedIn = false;
                      });
                    }
                  },
                )
              : ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AuthPage(),
                      ),
                    ).then((value) {
                      if (value == true) {
                        setState(() {
                          isLoggedIn = true;
                        });
                      }
                    });
                  },
                  child: const Text('Login/SignUp'),
                ),
        )
      ],
    );
  }
}
