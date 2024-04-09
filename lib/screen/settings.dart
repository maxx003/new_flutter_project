import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('This is a Settings Page'),
      bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          currentIndex: 0,
          items: const [
            BottomNavigationBarItem(
                backgroundColor: Color.fromARGB(255, 239, 166, 65),
                icon: Icon(Icons.home),
                label: 'Home'),
            BottomNavigationBarItem(
                backgroundColor: Color.fromARGB(255, 239, 166, 65),
                icon: Icon(Icons.search),
                label: 'Search'),
            BottomNavigationBarItem(
                backgroundColor: Color.fromARGB(255, 239, 166, 65),
                icon: Icon(Icons.settings),
                label: 'Settings'),
            BottomNavigationBarItem(
                backgroundColor: Color.fromARGB(255, 239, 166, 65),
                icon: Icon(Icons.person),
                label: 'Profile'),
          ],
          onTap: (int index) {
            switch (index) {
              case 0:
                Navigator.pushNamed(context, '/');
                break;
              case 2:
                Navigator.pushNamed(context, '/settings');
                break;
              case 3:
                Navigator.pushNamed(context, '/profile');
                break;
            }
          }),
    );
  }
}
