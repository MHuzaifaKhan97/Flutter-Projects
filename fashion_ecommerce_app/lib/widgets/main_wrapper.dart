import 'package:animate_do/animate_do.dart';
import 'package:bottom_bar_matu/bottom_bar/bottom_bar_bubble.dart';
import 'package:bottom_bar_matu/bottom_bar_matu.dart';
import 'package:fashion_ecommerce_app/screens/home_screen.dart';
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
        title: FadeIn(
          child: const Text(
            "Home",
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
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
      body: const HomeScreen(),
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
        },
      ),
    );
  }
}
