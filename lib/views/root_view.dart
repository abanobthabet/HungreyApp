import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hungry_app/core/utils/constant.dart';
import 'package:hungry_app/views/cartView.dart';
import 'package:hungry_app/views/homeView.dart';
import 'package:hungry_app/views/orderHistoryView.dart';
import 'package:hungry_app/views/profileView.dart';

class RootView extends StatefulWidget {
  const RootView({super.key});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  late PageController controller;
  late List<Widget> pages;
  int currentindex = 0;

  @override
  void initState() {
    pages = [Homeview(), Cartview(), Orderhistoryview(), Profileview()];

    controller = PageController(initialPage: currentindex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        physics: NeverScrollableScrollPhysics(),

        controller: controller,
        children: pages,
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          bottom: 25,
          left: 15,
          right: 15,
          top: 10,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.90),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.white.withOpacity(0.3)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: BottomNavigationBar(
            elevation: 0,
            enableFeedback: false,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.white,
            selectedItemColor: primrycolor,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            backgroundColor: Colors.transparent,
            currentIndex: currentindex,
            onTap: (index) {
              currentindex = index;
              setState(() {});
              controller.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.local_restaurant_outlined),
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
