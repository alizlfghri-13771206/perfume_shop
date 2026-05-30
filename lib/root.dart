import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:parfumo_ui/screens/collection_screen.dart';
import 'package:parfumo_ui/screens/home_screen.dart';
import 'package:parfumo_ui/screens/profile_screen.dart';
import 'package:parfumo_ui/screens/search_screen.dart';
import 'package:parfumo_ui/theme/app_theme.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentIndex = 0;

  List<IconData> icons = [
    Icons.home_outlined,
    Icons.storefront,
    Icons.shopping_cart,
     Icons.article_outlined,
    
  ];

  List<Widget> pages() {
    return [
      const HomeScreen(),
      const SearchScreen(),
      const CollectionScreen(),
      const ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(
              height: 40,
              width: 40,
              child: Image.asset("assets/images/profile.png")),
          SizedBox(
              height: 140,
              width: 140,
              child: Image.asset("assets/images/logo-h.png")),
          SizedBox(
              height: 50,
              width: 50,
              child: Image.asset("assets/images/notif.png")),
        ]),
      ),
      body: SafeArea(
        child: IndexedStack(
          index: currentIndex,
          children: pages(),
        ),
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        shadow: const BoxShadow(
          color: Color.fromARGB(84, 0, 0, 0),
          blurRadius: 3,
        ),
        activeIndex: currentIndex,
        icons: icons,
        iconSize: 30,
        gapLocation: GapLocation.center,
        activeColor: Colors.blueAccent,
        inactiveColor: Colors.black45,
        splashColor: Colors.blueAccent,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (int value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
            floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: () {},
        shape: const CircleBorder(),
        child: Image.asset("assets/images/tell.png", height:70),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
