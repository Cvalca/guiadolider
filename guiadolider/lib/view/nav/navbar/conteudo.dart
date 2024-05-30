import 'package:flutter/material.dart';
import 'home.dart';

class Conteudo extends StatefulWidget {
  const Conteudo({Key? key}) : super(key: key);


  @override
  State<Conteudo> createState() => _ConteudoState();
}

class _ConteudoState extends State<Conteudo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conteúdos'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
          child: Text('Go to home'),
        ),
      ),
    );
  }
}
