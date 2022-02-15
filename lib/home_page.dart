import 'package:fintory_sample/favorite_page.dart';
import 'package:fintory_sample/food_page.dart';
import 'package:fintory_sample/profile_page.dart';
import 'package:fintory_sample/search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> category = ['Main', 'Soups', 'Salads', 'Drinks'];
  late List<Widget> myTabs;
  late int click = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime currentBackPressTime = DateTime.now();

  final List<String> categoryImages = [
    'assets/image/main3.png',
    'assets/image/soups3.png',
    'assets/image/salad1.png',
    'assets/image/drinks1.png',
  ];

  final List<String> foodItemNames = [
    'Smoked Chicken with Fried Tomato',
    'Grilled Steak with Olive',
    'Pizza corn with Vegetables',
    'Steamed Shrimp and Veg',
    'Malabar Chicken Biriyani',
    'Mixed Nonveg Fried Rice',
    'Arabian Chicken Mandi',
    'Mexican Spicy Momos with Hot pepper sauce',
    'Shanghai Mushroom and Bamboo shoots',
    'Boneless Chicken Schezwan Noodles',
  ];
  final List<String> price = [
    '\$11',
    '\$15',
    '\$10',
    '\$12',
    '\$10',
    '\$12',
    '\$25',
    '\$08',
    '\$10',
    '\$15',
  ];
  final List<String> foodItems = [
    'assets/image/main3.png',
    'assets/image/beef1.png',
    'assets/image/pizza1.png',
    'assets/image/shrimp1.png',
    'assets/image/biriyani1.png',
    'assets/image/friedrice1.png',
    'assets/image/mandi1.png',
    'assets/image/momos1.png',
    'assets/image/mushroom1.png',
    'assets/image/noodles1.png',
  ];
  int _currentIndex = 0;
  bool flag = true;
  bool _iconPressed = false;
  String _searchQuery = "";
  bool _searchTabClicked = false;
  bool _searchItemExists = false;

  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    myTabs = [
      const Center(child: FoodPage()),
      Center(
        child: SearchPage(
          itemNames: foodItemNames,
          foodItems: foodItems,
          price: price,
          query: _searchQuery,
        ),
      ),
      const Center(
        child: FavoritePage(),
      ),
      const Center(
        child: ProfilePage(),
      ),
    ];

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.short_text),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        title: Container(
          alignment: _iconPressed ? Alignment.centerLeft : Alignment.topRight,
          child: _searchTabClicked ? SearchTab() : FoodTab(),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Image(
                image: AssetImage('assets/image/fintory1.png'),
              ),
              decoration: BoxDecoration(
                color: Color(0xFFFF6F00),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50.0),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home_filled,
                color: Color(0xFFFF6F00),
              ),
              title: const Text('Home'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
            ),
            ListTile(
              onTap: () {
                Fluttertoast.showToast(
                  msg: 'Loading Profile',
                  backgroundColor: const Color(0xFFFF6F00),
                  textColor: Colors.white,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                );
              },
              leading: const Icon(
                Icons.account_circle,
                color: Color(0xFFFF6F00),
              ),
              title: const Text('Profile'),
            ),
            ListTile(
              onTap: () {
                Fluttertoast.showToast(
                  msg: 'Contact Us for more',
                  backgroundColor: const Color(0xFFFF6F00),
                  textColor: Colors.white,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                );
              },
              leading: const Icon(
                Icons.call,
                color: Color(0xFFFF6F00),
              ),
              title: const Text('Contact Us'),
            ),
            const Divider(
              height: 20,
              thickness: 1,
              color: Colors.black26,
              indent: 20,
              endIndent: 20,
            ),
            ListTile(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: const Color(0x80FF6F00),
                      title: const Text(
                        'Do you really want to Log out?',
                        style: TextStyle(
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontSize: 20,
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: const Text(
                            'No',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            final sharedPreferences =
                                await SharedPreferences.getInstance();
                            sharedPreferences.remove('useremail');
                            Navigator.pop(context, true);
                            Fluttertoast.showToast(
                              msg: 'Logging out...',
                              backgroundColor: const Color(0xFFFF6F00),
                              textColor: Colors.white,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
                          },
                          child: const Text(
                            'Yes',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              leading: const Icon(
                Icons.logout,
                color: Color(0xFFFF6F00),
              ),
              title: const Text('Log out'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BottomNavigationBar(
          unselectedIconTheme: const IconThemeData(color: Colors.white54),
          selectedIconTheme: const IconThemeData(color: Color(0xFFFF6F00)),
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              if (_currentIndex == 1) {
                _searchTabClicked = true;
              } else {
                _searchTabClicked = false;
                _iconPressed = false;
              }
            });
          },
          items: const [
            BottomNavigationBarItem(
                backgroundColor: Colors.black87,
                icon: Icon(
                  Icons.fastfood,
                ),
                label: ''),
            BottomNavigationBarItem(
                backgroundColor: Colors.black87,
                icon: Icon(
                  Icons.search,
                ),
                label: ''),
            BottomNavigationBarItem(
                backgroundColor: Colors.black87,
                icon: Icon(
                  MdiIcons.cardsHeartOutline,
                ),
                label: ''),
            BottomNavigationBarItem(
                backgroundColor: Colors.black87,
                icon: Icon(
                  Icons.view_day_outlined,
                ),
                label: ''),
          ],
        ),
      ),
      body: WillPopScope(
        onWillPop: onWillPop,
        child: myTabs[_currentIndex],
      ),
    );
  }

  Future<bool> onWillPop() async {
    DateTime now = DateTime.now();
    bool backbutton = currentBackPressTime == null ||
        now.difference(currentBackPressTime) > const Duration(seconds: 2);
    if (backbutton) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: 'Press again to exit',
        backgroundColor: Colors.white,
        textColor: Colors.deepOrange,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );

      return false;
    } else {
      SystemNavigator.pop();
      return true;
    }
  }

  Widget FoodTab() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: const Image(
        image: AssetImage('assets/image/chris.jpg'),
        width: 40,
        height: 40,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget SearchTab() {
    if (_iconPressed) {
      return SizedBox(
        width: double.infinity,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            onChanged: (text) {
              setState(() {
                _searchQuery = text;
                print(_searchQuery);
              });
            },
            controller: _searchController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              fillColor: Colors.black,
              hintText: 'Search your food here....',
              prefixIcon: IconButton(
                icon: const Icon(MdiIcons.chevronLeft),
                color: const Color(0xFFFF6F00),
                onPressed: () {
                  setState(() {
                    _iconPressed = false;
                  });
                },
              ),
              suffixIcon: IconButton(
                icon: const Icon(Icons.close_rounded),
                iconSize: 20,
                color: Colors.black45,
                onPressed: () {
                  setState(() {
                    _searchQuery = "";
                    _searchController.clear();
                  });
                },
              ),
            ),
          ),
        ),
      );
    } else {
      return IconButton(
        onPressed: () {
          setState(() {
            _iconPressed = true;
          });
        },
        icon: const Icon(Icons.search),
        iconSize: 30,
        color: const Color(0xFFFF6F00),
      );
    }
  }
}
