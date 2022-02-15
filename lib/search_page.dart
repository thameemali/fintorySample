import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  late final List<String> itemNames;
  late final List<String> foodItems;
  late final List<String> price;
  late String query;

  SearchPage({
    Key? key,
    required this.query,
    required this.itemNames,
    required this.foodItems,
    required this.price,
  }) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  int i=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.query.isNotEmpty
          ? SearchResult()
          :  const Center(
              child: Text(
                'Search your food here',
                style: TextStyle(
                    color: Color(0xFFFF6F00),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
    );
  }

  Widget SearchResult() {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.itemNames.length,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          onTap: () {},
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
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Image.asset(
                          widget.foodItems[index],
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        widget.itemNames[index],
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
                            padding:
                                const EdgeInsets.only(left: 20.0, top: 10.0),
                            child: Text(
                              widget.price[index],
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
                            padding:
                                const EdgeInsets.only(right: 20.0, top: 10.0),
                            child: Image.asset(
                              'assets/image/chilli1.png',
                              alignment: Alignment.centerRight,
                              width: 30,
                              height: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
