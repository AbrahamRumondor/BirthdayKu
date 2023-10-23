import 'package:birthdayku/views/cart_screen.dart';
import 'package:birthdayku/views/home_screen.dart';
import 'package:birthdayku/views/search_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 1;

  @override
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const HomeScreen();
    var activePageTitle = 'Home Screen';

    if (_selectedPageIndex == 0) {
      activePage = const SearchScreen();
      activePageTitle = 'Search Screen';
    } else if (_selectedPageIndex == 1) {
      activePage = const HomeScreen();
      activePageTitle = 'Home Screen';
    } else {
      activePage = const CartScreen();
      activePageTitle = 'Cart Screen';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: '',
          ),
        ],
      ),
    );
  }
}
