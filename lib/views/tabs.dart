import 'package:birthdayku/data/promo_data.dart';
import 'package:birthdayku/data/user_data.dart';
import 'package:birthdayku/models/user_model.dart';
import 'package:birthdayku/views/cart_screen.dart';
import 'package:birthdayku/views/home_screen.dart';
import 'package:birthdayku/views/search_screen.dart';
import 'package:birthdayku/widgets/create_dialog.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key, required this.userID});

  final String userID;

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 1;

  User? account;

  @override
  void initState() {
    super.initState();
    account = allUser.firstWhere((user) => user.id == widget.userID);
    if (account != null) account!.promos.addAll(allPromo);
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = HomeScreen(
      userID: widget.userID,
    );
    var activePageTitle = 'Home Screen';

    if (_selectedPageIndex == 0) {
      activePage = SearchScreen(userID: widget.userID);
      activePageTitle = 'Search Screen';
    } else if (_selectedPageIndex == 1) {
      activePage = HomeScreen(userID: widget.userID);
      activePageTitle = 'Home Screen';
    } else {
      activePage = CartScreen(
        myContext: context,
        account: account!,
      );
      activePageTitle = 'Cart Screen';
    }
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        backgroundColor: const Color.fromRGBO(246, 202, 183, 1),
        title: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.008,
            left: MediaQuery.of(context).size.height * 0.01,
            right: MediaQuery.of(context).size.height * 0.01,
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Welcome,",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    account!.name,
                    style: const TextStyle(
                      color: Color.fromRGBO(156, 45, 65, 1),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Expanded(child: Container()),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => CreateDialog(),
                  );
                },
                icon: Image.asset(
                  'assets/img/cart.png',
                  width: 35,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () {
                  print("clicked");
                },
                icon: ClipOval(
                  child: Image.asset(
                    'assets/img/userImg/pp_default.png',
                    width: 40.0,
                    height: 40.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
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
