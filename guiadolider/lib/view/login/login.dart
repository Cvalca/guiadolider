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
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isButtonDisabled = true;

  @override
  void initState() {
    super.initState();
    _loginController.addListener(_validateInputs);
    _passwordController.addListener(_validateInputs);
  }

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _validateInputs() {
    setState(() {
      _isButtonDisabled = _loginController.text.isEmpty || _passwordController.text.isEmpty;
    });
  }

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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Tutorial()),
              );
            },
          ),
        ],
      ),
      backgroundColor: Color(0xFF4C5E72),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: constraints.maxWidth * 0.05,
                  vertical: constraints.maxHeight * 0.05,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/logo-login.png',
                      height: constraints.maxHeight * 0.3,
                    ),
                    SizedBox(height: constraints.maxHeight * 0.02),
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextFormField(
                            controller: _loginController,
                            decoration: InputDecoration(
                              labelText: 'Login',
                              labelStyle: TextStyle(color: Color(0XFFFFE45C)),
                              hintStyle: TextStyle(color: Color(0XFFFFE45C)),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0XFFFFE45C)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                            style: TextStyle(color: Colors.white),
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
                          SizedBox(height: constraints.maxHeight * 0.02),
                          TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              labelText: 'Senha',
                              labelStyle: TextStyle(color: Color(0XFFFFE45C)),
                              hintStyle: TextStyle(color: Color(0XFFFFE45C)),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0XFFFFE45C)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                            style: TextStyle(color: Colors.white),
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
                          SizedBox(height: constraints.maxHeight * 0.03),
                          Center(
                            child: ElevatedButton(
                              onPressed: _isButtonDisabled
                                  ? null
                                  : () {
                                      Navigator.pushReplacementNamed(
                                        context,
                                        '/home',
                                      );
                                    },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: _isButtonDisabled
                                    ? Colors.grey
                                    : Colors.greenAccent.shade700,
                                padding: EdgeInsets.symmetric(
                                  vertical: constraints.maxHeight * 0.02,
                                  horizontal: constraints.maxWidth * 0.3,
                                ),
                              ),
                              child: Text(
                                'Login',
                                style: TextStyle(color: Color(0xFF4C5E72)),
                              ),
                            ),
                          ),
                          SizedBox(height: constraints.maxHeight * 0.02),
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Cadastro()),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: constraints.maxHeight * 0.02),
                                child: Text(
                                  'Não tem uma conta? Cadastre-se',
                                  style: TextStyle(
                                    color: Color(0XFFFFE45C),
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.yellow,
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
            );
          },
        ),
      ),
    );
  }
}
