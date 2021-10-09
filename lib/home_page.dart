import 'dart:ui';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CallZap'),
      ),
      body: Center(
        child: GestureDetector(
          child: Text(
            'Contador $counter',
            style: const TextStyle(fontSize: 40),
          ),
          onTap: () {
            setState(() {
              counter++;
            });
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.message),
        onPressed: () {
          setState(() {
            counter++;
          });
        },
      ),
    );
  }
}
