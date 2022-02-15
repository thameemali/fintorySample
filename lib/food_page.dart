import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'food_details.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  final List<String> category = ['Main', 'Soups', 'Salads', 'Drinks'];

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

  int _selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                        padding: const EdgeInsets.only(left: 20.0, top: 30.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          color: _selectedCategoryIndex == index
                              ? const Color(0xE1262424)
                              : Colors.white,
                          elevation: 10,
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
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
                        padding: const EdgeInsets.only(left: 20.0, top: 8.0),
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
              padding: EdgeInsets.only(left: 20.0, top: 50.0, bottom: 20.0),
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
                    padding: const EdgeInsets.only(left: 20.0, top: 20.0),
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
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
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
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                foodItemNames[index],
                                maxLines: 2,
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
    );
  }
}
