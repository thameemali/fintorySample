import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Your Favorites',
          style: TextStyle(
              color: Color(0xFFFF6F00),
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
