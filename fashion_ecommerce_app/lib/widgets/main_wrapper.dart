import 'package:animate_do/animate_do.dart';
import 'package:bottom_bar_matu/bottom_bar_matu.dart';
import 'package:fashion_ecommerce_app/screens/home_screen.dart';
import 'package:fashion_ecommerce_app/screens/search_screen.dart';
import 'package:fashion_ecommerce_app/utils/global_constants.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _index = 0;
  bool isSearchActive = false;
  List<Widget> pages = [
    const HomeScreen(),
    const SearchScreen(),
    const Scaffold(
      body: Center(
        child: Text(
          "Explore Screen",
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
      ),
    ),
    const Scaffold(
      body: Center(
        child: Text(
          "Setting Screen",
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
      ),
    ),
    const Scaffold(
      body: Center(
        child: Text(
          "Mail Screen",
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            )),
        title: isSearchActive
            ? FadeIn(
                delay: const Duration(milliseconds: 300),
                child: const Text(
                  "Search",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              )
            : FadeIn(
                delay: const Duration(milliseconds: 300),
                child: const Text(
                  "Home",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isSearchActive = !isSearchActive;
                });
              },
              icon: isSearchActive
                  ? const Icon(
                      LineIcons.searchMinus,
                      color: Colors.black,
                      size: 30,
                    )
                  : const Icon(
                      LineIcons.search,
                      color: Colors.black,
                      size: 30,
                    )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                LineIcons.shoppingBag,
                color: Colors.black,
                size: 30,
              ))
        ],
      ),
      body: isSearchActive ? const SearchScreen() : pages[_index],
      bottomNavigationBar: BottomBarBubble(
        color: primaryColor,
        selectedIndex: _index,
        items: [
          BottomBarItem(iconData: Icons.home),
          BottomBarItem(iconData: Icons.search),
          BottomBarItem(iconData: Icons.explore),
          BottomBarItem(iconData: Icons.settings),
          BottomBarItem(iconData: Icons.mail),
        ],
        onSelect: (index) {
          _index = index;
          setState(() {});
        },
      ),
    );
  }
}
