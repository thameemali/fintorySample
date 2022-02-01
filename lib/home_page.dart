import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xFFFF6F00),
        title: const Center(child: Text("Fintory")),
      ),
      body: const Center(
        child: Text('Welcome Back',style: TextStyle(
          fontSize: 40,color: Colors.orange,fontWeight: FontWeight.bold
        ),),
      ),
    );
  }
}
