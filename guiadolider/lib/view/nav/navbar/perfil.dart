import 'package:flutter/material.dart';

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil', style: TextStyle(color: Color(0XFFFFE45C))),
        backgroundColor: Color(0xFF5281B3),
        centerTitle: true,
      ),

      backgroundColor: Color(0xFF4C5E72),

      body: Center(
        child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  '/',
                );
              },
              child: Text('Sair da conta'),
            ),
          ],
        ),
      ),
    );
  }
}