import 'package:fintory_sample/buffer_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FoodDetails extends StatefulWidget {
  var item, itemName, price;

  FoodDetails({Key? key, this.item, this.itemName, this.price})
      : super(key: key);

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  int _counterValue = 0;
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.loose,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.50,
            decoration: const BoxDecoration(
              color: Color(0xFF340D02),
            ),
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.only(
              top: 40.0,
              bottom: 40.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 60.0, bottom: 40.0),
                    child: Image.asset(
                      widget.item,
                      height: 250,
                      width: 250,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0,bottom: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: const Color(0xFFFF6F00),width: 2.0
                            ),
                            color: Colors.white,
                          ),
                          height: 35,
                          width: 35,
                          alignment: Alignment.center,
                          child: const Text(
                            'F',
                            style: TextStyle(
                              color: Color(0xFFFF6F00),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white,
                          border: Border.all(
                              color: const Color(0xFFFF6F00),width: 2.0
                          ),
                        ),
                        height: 35,
                        width: 35,
                        alignment: Alignment.center,
                        child: const Text(
                          'H',
                          style: TextStyle(
                            color: Color(0xFFFF6F00),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 280.0),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                )),
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, top: 30.0),
                  child: Text(
                    widget.itemName,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30.0, top: 30.0),
                        child: RatingBar.builder(
                          itemSize: 20,
                          initialRating: 4.5,
                          allowHalfRating: true,
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Color(0xFFFF6F00),
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          widget.price + ".00",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 30.0,
                  ),
                  child: Text('64 Ratings'),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, top: 30.0),
                      child: Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(300.0),
                          ),
                          color: Color(0xFFFF6F00),
                        ),
                        child: const Image(
                          image: AssetImage('assets/image/hotell1.png'),
                          width: 45,
                          height: 40,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0, top: 20.0),
                          child: Text(
                            'Spoon \'N\' Fork',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0, top: 10.0),
                          child: Text(
                            'Brand',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 60.0, top: 20.0),
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30.0),
                          ),
                          color: Colors.white,
                          border: Border.all(
                            color: const Color(0xFFFF6F00),
                          ),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (_counterValue > 0) {
                                    _counterValue = _counterValue - 1;
                                    flag = false;
                                  } else {
                                    _counterValue = 0;
                                    flag = true;
                                  }
                                });
                              },
                              iconSize: 15,
                              icon: Icon(
                                Icons.remove,
                                color: flag
                                    ? Colors.black26
                                    : const Color(0xFFFF6F00),
                              ),
                            ),
                            Text(_counterValue.toString()),
                            IconButton(
                              iconSize: 15,
                              onPressed: () {
                                setState(() {
                                  _counterValue = _counterValue + 1;
                                  flag = false;
                                });
                              },
                              icon: const Icon(
                                Icons.add,
                                color: Color(0xFFFF6F00),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 30.0, right: 30.0, top: 40.0, bottom: 0.0),
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing "
                      "and typesetting industry. Lorem Ipsum has been the"
                      " industry's standard dummy text ever since the "
                      "1500s, when an unknown printer took a "
                      "galley of type and scrambled it to make a type "
                      "specimen book. ...",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        height: 1.8,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(30.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Fluttertoast.showToast(
                          msg: 'Item Added to Cart',
                          backgroundColor: const Color(0xFFFF6F00),
                          textColor: Colors.white,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BufferPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Add to Cart',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 5,
                        primary: const Color(0xFFFF6F00),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
