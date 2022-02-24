import 'dart:ui';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:callzap/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int counter = 0;
  var _numeroPhone = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CallZap'),
        actions: [
          Text('Dark:'),
          keyDark(),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: const Text(
                'Logo do CallZap \n',
                style: TextStyle(fontSize: 30),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text('Digite o número do ZAP:'),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  TelefoneInputFormatter(),
                ],
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Número',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        print('Tentando limpar campo.');
                      });
                    },
                    icon: Icon(Icons.clear),
                  ),
                ),
                onSaved: (numero) {
                  _numeroPhone = numero;
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.message),
        onPressed: () {
          setState(() {
            print('Tentando chamar no ZAP');
            print(_numeroPhone);
          });
        },
      ),
    );
  }
}



class keyDark extends StatelessWidget {
  const keyDark({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: AppController.instance.isDartTheme,
      onChanged: (bool value) {
        AppController.instance.chargeTheme();
        print('Botão dark');
      },
    );
  }
}
