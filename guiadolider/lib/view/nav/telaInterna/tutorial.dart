import 'package:flutter/material.dart';

class Tutorial extends StatefulWidget {
  const Tutorial({Key? key}) : super(key: key);

  @override
  State<Tutorial> createState() => _TutorialState();
}

class _TutorialState extends State<Tutorial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tutorial', style: TextStyle(color: Color(0XFFFFE45C))),
        backgroundColor: Color(0xFF5281B3),
        centerTitle: true,
        iconTheme: IconThemeData(color: Color(0XFFFFE45C)),        
      ),

      backgroundColor: Color(0xFF4C5E72),

      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Voltar'),
        ),
      ),
      
    );
  }
}