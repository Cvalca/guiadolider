import 'package:flutter/material.dart';
import 'package:guiadolider/view/nav/navbar/conteudo.dart';
import 'package:guiadolider/view/nav/navbar/perfil.dart';
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Center(
              child: Image.asset(
                'assets/images/logo-horizontal.png', // Caminho da imagem da logomarca
                height: 200,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Center(
              child: Text(
                'O que você quer fazer?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Tutorial()),
                      );
                    },

                    child: CardWidget(
                      title: 'Ver conteúdos',
                      icon: Icons.book,
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Perfil()),
                      );
                    },
                    child: CardWidget(
                      title: 'Visualizar perfil',
                      icon: Icons.person,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String title;
  final IconData icon;

  const CardWidget({
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

