import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import 'package:assessment_app/services/index.dart';
import 'package:assessment_app/utils/index.dart';
import 'index.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final api = FetchData();
  int selectedIndex = 0;

  static List<Widget> _screens = [
    MainHomePage(),
    MainHomePage(),
    MainHomePage(),
    MainHomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _screens[selectedIndex],
        floatingActionButton: InkWell(
          onTap: () {},
          child: CircleAvatar(
            radius: 20,
            backgroundColor: liveColor,
            child: Center(
              child: Icon(
                Icons.live_tv,
                color: Colors.white,
              ),
            ),
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.black54,
          onTap: (x) {
            print('changed to $x');
            setState(() {
              selectedIndex = x;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Badge(
                badgeContent: Text(
                  '3',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                child: CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage(
                    api.profileImage,
                  ),
                ),
              ),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}
