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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Tutorial()),
              );
            },
          ),
        ],
      ),
      backgroundColor: Color(0xFF4C5E72),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double paddingHorizontal = constraints.maxWidth * 0.05;
          double paddingVertical = constraints.maxHeight * 0.05;
          double imageHeight = constraints.maxHeight * 0.2;
          double cardWidthFactor = constraints.maxWidth > 600 ? 0.7 : 0.9;

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/images/logo-horizontal.png',
                  height: imageHeight,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: paddingVertical * 0.2),
                  child: Center(
                    child: Text(
                      'O que você quer fazer?',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0XFFFFE45C)),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(paddingVertical * 0.5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                              context,
                              '/conteudo',
                            );
                          },
                          child: FractionallySizedBox(
                            widthFactor: cardWidthFactor,
                            child: CardWidget(
                              title: 'Ver conteúdos',
                              icon: Icons.book
                            ),
                          ),
                        ),
                        SizedBox(height: paddingVertical * 0.2),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                              context,
                              '/perfil',
                            );
                          },
                          child: FractionallySizedBox(
                            widthFactor: cardWidthFactor,
                            child: CardWidget(
                              title: 'Visualizar perfil',
                              icon: Icons.person,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
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
              color: Colors.black, // Alteração da cor do ícone para azul
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Alteração da cor do texto para azul
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
