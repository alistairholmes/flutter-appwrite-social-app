import 'package:flutter/material.dart';
import 'package:flutter_appwrite_demo/ui/home/home_screen.dart';
import 'package:flutter_appwrite_demo/ui/my_profile/my_profile.dart';

class Base extends StatefulWidget {
  @override
  _BaseState createState() => _BaseState();
}

class _BaseState extends State<Base> {
  int _current = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    //AddNew(),
    MyProfile(),
  ];

  void _onTap(int index) {
    try {
      // Catch RangeError for missing pages
      setState(() {
        _current = index;
      });
    } catch (e) {
      // page unimplemented
      print('Missing Page');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_current],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTap,
        currentIndex: _current,
        items: [
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.home,
                color: Color(0xfff02e65),
              ),
              icon: Icon(
                Icons.home,
                color: Colors.grey[600],
              ),
              title: Text(
                "Home",
                style: TextStyle(color: Colors.grey[600]),
              ),
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.add_box,
                color: Color(0xfff02e65),
              ),
              icon: Icon(
                Icons.add_box,
                color: Colors.grey[600],
              ),
              title: Text(
                "Add New",
                style: TextStyle(color: Colors.grey[600]),
              ),
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.person,
                color: Color(0xfff02e65),
              ),
              icon: Icon(
                Icons.person,
                color: Colors.grey[600],
              ),
              title: Text(
                "My Profile",
                style: TextStyle(color: Colors.grey[600]),
              ),
              backgroundColor: Colors.white),
        ],
      ),
    );
  }
}
