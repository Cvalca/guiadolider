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
        backgroundColor: Color(0xFF5281B3),
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
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(              
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                // Adicione a imagem do logo aqui
                Image.asset(
                  'assets/images/logo-login.png', // caminho da imagem do logo
                  height: 300, // altura da imagem
                ),
                SizedBox(height: 10), // Espaço entre o logo e os campos do formulário
                Form(
                  // key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Login',
                          labelStyle: TextStyle(color: Color(0XFFFFE45C)),
                          hintStyle: TextStyle(color: Color(0XFFFFE45C)), //Define a cor do texto de dica.
                        ),
                        style: TextStyle(color: Colors.white), //Define a cor do texto do campo de entrada.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Entre com seu email de login';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          // _username = value!;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          labelStyle: TextStyle(color: Color(0XFFFFE45C)),
                          hintStyle: TextStyle(color: Color(0XFFFFE45C)), //Define a cor do texto de dica.
                        ),
                        style: TextStyle(color: Colors.white), //Define a cor do texto do campo de entrada.
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Entre com sua senha';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          // _password = value!;
                        },
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            // if (_formKey.currentState!.validate()) {
                            //   _formKey.currentState!.save();
                            //   // Process data.
                            //   // print('Username: $_username');
                            //   // print('Password: $_password');
                            // }
                            Navigator.pushReplacementNamed(
                              context,
                              '/home',
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.greenAccent.shade700, // Cor de fundo do botão
                          ),
                          child: Text('Login', style: TextStyle(color: Color(0xFF4C5E72)),),
                        ),
                      ),
                      Center( // Centraliza o texto
                        child: GestureDetector(
                          onTap: () {
                            // Navegar para a página de cadastro ao clicar no texto
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Cadastro()),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'Não tem uma conta? Cadastre-se',
                              style: TextStyle(
                                color: Color(0XFFFFE45C),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//[
      //       ElevatedButton(
      //         onPressed: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => Tutorial()),
      //           );
      //         },
      //         child: Text('Go to tutorial'),
      //       ),
      //       SizedBox(height: 20), // Espaço entre os botões
      //       ElevatedButton(
      //         onPressed: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => Cadastro()),
      //           );
      //         },
      //         child: Text('Go to cadastro'),
      //       ),
      //        SizedBox(height: 20), // Espaço entre os botões
      //       ElevatedButton(
      //         onPressed: () {
      //           Navigator.pushReplacementNamed(
      //             context,
      //             '/home',
      //           );
      //         },
      //         child: Text('Go to home'),
      //       ),
      //     ],

      
              // showDialog(
              //   context: context,
              //   builder: (context) {
              //     return AlertDialog(
              //       title: Text('Informação'),
              //       content: Text('Aqui está alguma informação importante.'),
              //       actions: <Widget>[
              //         TextButton(
              //           child: Text('Fechar'),
              //           onPressed: () {
              //             Navigator.of(context).pop();
              //           },
              //         ),
              //       ],
              //     );
              //   },
              // );