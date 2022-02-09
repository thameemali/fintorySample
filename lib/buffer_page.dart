import 'package:fintory_sample/food_details.dart';
import 'package:fintory_sample/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BufferPage extends StatefulWidget {
  const BufferPage({Key? key}) : super(key: key);

  @override
  State<BufferPage> createState() => _BufferPageState();
}

class _BufferPageState extends State<BufferPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime currentBackPressTime = DateTime.now();

  final List<String> category = ['Main', 'Soups', 'Salads', 'Drinks'];

  final tabs = [
    const Center(
      child: Text(
        'Search for your food',
        style: TextStyle(
            color: Color(0xFFFF6F00),
            fontSize: 30,
            fontWeight: FontWeight.bold),
      ),
    ),
    const Center(
      child: Text(
        'Your Favorites',
        style: TextStyle(
            color: Color(0xFFFF6F00),
            fontSize: 30,
            fontWeight: FontWeight.bold),
      ),
    ),
    const Center(
      child: Text(
        'Your Profile',
        style: TextStyle(
            color: Color(0xFFFF6F00),
            fontSize: 30,
            fontWeight: FontWeight.bold),
      ),
    ),
  ];

  final List<String> categoryImages = [
    'assets/image/main3.png',
    'assets/image/soups3.png',
    'assets/image/salad1.png',
    'assets/image/drinks1.png',
  ];

  List<String> foodItemNames = [
    'Smoked Chicken with Fried Tomato',
    'Grilled Steak with Olive',
    'Pizza corn with Vegetables',
    'Steamed Shrimp and Veg'
  ];
  List<String> price = [
    '\$11',
    '\$15',
    '\$10',
    '\$12',
  ];
  List<String> foodItems = [
    'assets/image/main3.png',
    'assets/image/beef1.png',
    'assets/image/pizza1.png',
    'assets/image/shrimp1.png',
  ];
  int _currentIndex = 0;
  int _selectedCategoryIndex = 0;
  bool flag = true;

  @override
  Widget build(BuildContext context) {
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
          alignment: Alignment.topRight,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: const Image(
              image: AssetImage('assets/image/chris.jpg'),
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
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
                    builder: (context) => const BufferPage(),
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
              onTap: () async {
                final sharedPreferences = await SharedPreferences.getInstance();
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
              if (_currentIndex > 0) {
                flag = false;
              } else {
                flag = true;
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
                icon: Icon(
                  Icons.search,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  MdiIcons.cardsHeartOutline,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.view_day_outlined,
                ),
                label: ''),
          ],
        ),
      ),
      body: flag
          ? WillPopScope(
              onWillPop: onWillPop,
              child: Container(
                color: Colors.white,
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20.0, top: 10.0),
                      child: Text(
                        'Good food.\nFast delivery.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) =>
                            GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedCategoryIndex = index;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, top: 30.0),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  color: _selectedCategoryIndex == index
                                      ? const Color(0xE1262424)
                                      : Colors.white,
                                  elevation: 10,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Image.asset(
                                        categoryImages[index],
                                        width: 40,
                                        height: 40,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20.0, top: 8.0),
                                child: Text(
                                  category[index],
                                  style: const TextStyle(
                                    color: Colors.black45,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        itemCount: categoryImages.length,
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.only(left: 20.0, top: 50.0, bottom: 20.0),
                      child: Text(
                        'Popular Now',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 280,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: foodItemNames.length,
                        itemBuilder: (BuildContext context, int index) =>
                            GestureDetector(
                          onTap: () {
                            setState(() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FoodDetails(
                                      item: foodItems[index],
                                      itemName: foodItemNames[index],
                                      price: price[index]),
                                ),
                              );
                            });
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, top: 20.0),
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: SizedBox(
                                height: 300,
                                width: 160,
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(30.0),
                                        child: Image.asset(
                                          foodItems[index],
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20.0),
                                      child: Text(
                                        foodItemNames[index],
                                        maxLines: 3,
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20.0, top: 10.0),
                                            child: Text(
                                              price[index],
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 20.0, top: 10.0),
                                            child: Image.asset(
                                              'assets/image/chilli1.png',
                                              alignment: Alignment.centerRight,
                                              width: 30,
                                              height: 30,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : WillPopScope(child: tabs[_currentIndex - 1], onWillPop: onWillPop),
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
}
