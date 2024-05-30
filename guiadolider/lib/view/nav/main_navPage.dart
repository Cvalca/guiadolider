import 'package:flutter/material.dart';
import 'package:guiadolider/view/nav/navbar/conteudo.dart';
import 'package:guiadolider/view/nav/navbar/home.dart';
import 'package:guiadolider/view/nav/navbar/perfil.dart';

class MainNavPage extends StatefulWidget {
  MainNavPage({Key? key, this.currentIndex}) : super(key: key);

  int? currentIndex;

  @override
  State<MainNavPage> createState() => _MainNavPageState();
}

class _MainNavPageState extends State<MainNavPage> {
  get currentIndex => widget.currentIndex;

  List pages = [
    const Home(),
    const Conteudo(),
    const Perfil(),
  ];

  void onTap(int index) {
    setState(() {
      widget.currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTap,
          currentIndex: currentIndex,
          iconSize: 30,
          selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
          unselectedItemColor: const Color.fromARGB(255, 110, 110, 110),
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: "Conteudo"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
          ]),
    );
  }
}