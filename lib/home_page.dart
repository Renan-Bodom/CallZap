import 'dart:ui';

import 'package:callzap/app_controller.dart';
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
        actions: [Text('Dark:'),
        Switch(
          value: AppController.instance.isDartTheme,
          onChanged: (bool value) {
            AppController.instance.chargeTheme();
            print('Botão dark');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
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
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              child: const Text(
                'Zerar',
                style: TextStyle(fontSize: 40),
              ),
              onTap: () {
                setState(() {
                  counter = 0;
                });
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text('CAMPO TELEFONE!'),
          ),
        ],
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
