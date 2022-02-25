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
  String _numeroPhone = '';
  String tentandoAbrir = '';

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
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Container(
              height: 25,
            ),
            Text(
              'Logo do CallZap',
              style: TextStyle(fontSize: 30),
            ),
            Container(
              height: 50,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Text('Digite o número do ZAP:'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 170,
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
                    onChanged: (numero) {
                      _numeroPhone = numero;
                      tentandoAbrir = 'Tetando chamar no ZAP: ';
                    },
                  ),
                ),
                GestureDetector(
                  child: Text('Enviar'),
                  onTap: () {
                    setState(() {
                      print('Tentando enviar o campo');
                    });
                  },
                ),
              ],
            ),
            Container(
              height: 100,
            ),
            Text('$tentandoAbrir' + '$_numeroPhone')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.message),
        onPressed: () {
          setState(() {
            print('$tentandoAbrir' + _numeroPhone);
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
