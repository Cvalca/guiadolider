import 'package:flutter/material.dart';
import 'package:guiadolider/view/nav/navbar/conteudo.dart';
import '../telaInterna/tutorial.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5281B3),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info_outline),
            iconSize: 40.0,
            color: Color(0XFFFFE45C),
            onPressed: () {
              // Ação ao pressionar o botão de informação
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Tutorial()),
                );
            },
          ),
        ],
      ),

      backgroundColor: Color(0xFF4C5E72),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Tutorial()),
                );
              },
              child: Text('Go to tutorial'),
            ),
            SizedBox(height: 20), // Espaço entre os botões
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Conteudo()),
                );
              },
              child: Text('Go to conteudo'),
            ),
          ],
        ),
      ),
    );
  }
}


