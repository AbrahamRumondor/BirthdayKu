import 'package:birthdayku/data/promo_data.dart';
import 'package:birthdayku/data/user_data.dart';
import 'package:birthdayku/models/user_model.dart';
import 'package:birthdayku/views/cart_screen.dart';
import 'package:birthdayku/views/home_screen.dart';
import 'package:birthdayku/views/profile_screen.dart';
import 'package:birthdayku/views/search_screen.dart';
import 'package:birthdayku/widgets/create_dialog.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen(
      {super.key,
      required this.userID,
      required this.activePage,
      required this.cartState});

  final String userID;
  final String activePage;
  final String cartState;

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 1;

  User? account;

  String activePageTitle = 'Home Screen';

  // var activePageTitle = 'Home Screen';

  void setLogOut() {
    account = null;
  }

  @override
  void initState() {
    activePageTitle = widget.activePage;
    if (activePageTitle.compareTo('Cart Screen') == 0) {
      _selectedPageIndex = 2;
    }
    super.initState();
    account = allUser.firstWhere((user) => user.id == widget.userID);
    if (account != null) account!.promos.addAll(allPromo);
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  Widget activePage = Text("");

  String searchCategory = 'venue';

  void goSearchScreen(String input) {
    setState(() {
      _selectedPageIndex = 0;
      searchCategory = input;
    });
  }

  @override
  Widget build(BuildContext context) {
    activePage = HomeScreen(
      userID: widget.userID,
      goSearchScreen: goSearchScreen,
    );

    if (_selectedPageIndex == 0) {
      print("TES MASUK KE SINI");
      activePage = SearchScreen(
        account: account!,
        category: searchCategory,
      );
      activePageTitle = 'Search Screen';
    } else if (_selectedPageIndex == 1) {
      activePage = HomeScreen(
        userID: widget.userID,
        goSearchScreen: goSearchScreen,
      );
      activePageTitle = 'Home Screen';
    } else {
      activePage = CartScreen(
        myContext: context,
        account: account!,
        btn: widget.cartState,
      );
      activePageTitle = 'Cart Screen';
    }
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                  account != null
                      ? Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ProfileScreen(
                              account: account!,
                              setLogOut: setLogOut,
                            ),
                          ),
                        )
                      : print("ERROR");
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
