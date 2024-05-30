import 'package:flutter/material.dart';
import 'package:guiadolider/view/nav/main_navPage.dart';
import 'package:guiadolider/view/nav/navbar/home.dart';
import 'package:guiadolider/view/nav/telaInterna/tutorial.dart';
import 'package:guiadolider/view/login/cadastro.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
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
                  MaterialPageRoute(builder: (context) => Cadastro()),
                );
              },
              child: Text('Go to cadastro'),
            ),
             SizedBox(height: 20), // Espaço entre os botões
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  '/home',
                );
              },
              child: Text('Go to home'),
            ),
          ],
        ),
      ),
    );
  }
}
