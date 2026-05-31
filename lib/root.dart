import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:parfumo_ui/models/perfume.dart';
import 'package:parfumo_ui/screens/articles_screen.dart';
import 'package:parfumo_ui/screens/contact_us.dart';
import 'package:parfumo_ui/screens/home_screen.dart';
import 'package:parfumo_ui/screens/shoping_cart_screen.dart';
import 'package:parfumo_ui/screens/store_screen.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  List<Perfume> selectedToBuy = [];
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
      const StoreScreen(),
      ShopingCartScreen(inShoppingCartPerfumes: selectedToBuy),
      const ArticlesScreen(),
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
              height: 32,
              width: 32,
              child: Image.asset("assets/images/profile.png")),
          SizedBox(
              height: 130,
              width: 130,
              child: Image.asset("assets/images/logo-h.png")),
          SizedBox(
              height: 45,
              width: 45,
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
        iconSize: 26,
        gapLocation: GapLocation.center,
        activeColor: Colors.blueAccent,
        inactiveColor: Colors.black45,
        splashColor: Colors.blueAccent,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (int value) {
          setState(() {
            currentIndex = value;
            List<Perfume> buy = Perfume.addedToCartPlants();
            selectedToBuy = buy;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.of(context).push(
            PageTransition(
                type: PageTransitionType.bottomToTop, child: const ContactUs()),
          );
        },
        shape: const CircleBorder(),
        child: Image.asset("assets/images/tell.png", height: 70),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
