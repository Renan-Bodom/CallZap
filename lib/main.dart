import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() {
  runApp(AppWidget(title: 'CallZap!',));
}




class AppWidget extends StatelessWidget {
  final String title;

  const AppWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    var textoTitulo1 = const TextStyle(color: Colors.white, fontSize: 40.0);

    return Container(
      child: Center(
        child: Text(
          title,
          textDirection: TextDirection.ltr,
          style: textoTitulo1,
        ),
      ),
    );
  }
}
