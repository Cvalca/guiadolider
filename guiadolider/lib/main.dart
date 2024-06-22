import 'package:flutter/material.dart';

import 'package:guiadolider/view/login/cadastro.dart';
import 'package:guiadolider/view/nav/main_navPage.dart';
import 'package:guiadolider/view/nav/navbar/home.dart';
import 'package:guiadolider/view/login/login.dart';
import 'package:guiadolider/view/nav/navbar/perfil.dart';
import 'package:guiadolider/view/nav/telaInterna/tutorial.dart';
import 'package:guiadolider/view/nav/navbar/conteudo.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guia do Lider',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: <String, WidgetBuilder>{
        "/": (BuildContext context) => const Login(),
        "/home": (BuildContext context) => MainNavPage(currentIndex: 0),
        "/cadastrar": (BuildContext context) => const Cadastro(),
        "/tutorial": (BuildContext context) => const Tutorial(),
        "/conteudo": (BuildContext context) => MainNavPage(currentIndex: 1),
        "/perfil": (BuildContext context) => MainNavPage(currentIndex: 2),
      }
    );
  }
}


/*
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: "/",
        routes: <String, WidgetBuilder>{
          "/": (BuildContext context) => const Home(),
          "/entrar": (BuildContext context) => const Login(),
          "/cadastrar": (BuildContext context) => const Cadastro(),
          "/tutorial": (BuildContext context) => Tutorial(),
          "/conteudo": (BuildContext context) => Conteudo(),
        });
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondScreen()),
            );
          },
          child: Text('Go to Second Screen'),
        ),
      ),
    );
  }
}
*/


/*
class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Back to Home Screen'),
        ),
      ),
    );
  }
}
*/