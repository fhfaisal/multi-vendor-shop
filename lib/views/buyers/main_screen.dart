import 'package:flutter/material.dart';
import 'package:multivendor_store/views/buyers/nav_screens/account_screen.dart';
import 'package:multivendor_store/views/buyers/nav_screens/cart_screen.dart';
import 'package:multivendor_store/views/buyers/nav_screens/category_screen.dart';
import 'package:multivendor_store/views/buyers/nav_screens/home_screen.dart';
import 'package:multivendor_store/views/buyers/nav_screens/search_screen.dart';
import 'package:multivendor_store/views/buyers/nav_screens/store_screen.dart';
import 'package:multivendor_store/widget_setting/color_collections.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}
int _pageIndex=0;
List<Widget> _pages=[
  HomeScreen(),
  CategoryScreen(),
  StoreScreen(),
  CartScreen(),
  SearchScreen(),
  AccountScreen()
];
class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          currentIndex: _pageIndex,
          onTap: (value){
            setState(() {
              _pageIndex=value;
            });
          },
          unselectedItemColor: secondaryColor,
          selectedItemColor: primaryColors,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold,),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: 'HOME'),
            BottomNavigationBarItem(icon: Icon(Icons.explore_outlined),label: 'CATEGORIES'),
            BottomNavigationBarItem(icon: Icon(Icons.store),label: 'STORE'),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined),label: 'CART'),
            BottomNavigationBarItem(icon: Icon(Icons.search_outlined),label: 'SEARCH'),
            BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined),label: 'ACCOUNT'),
          ],
        ),
        body: _pages[_pageIndex],
      ),
    );
  }
}
