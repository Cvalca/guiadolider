import 'package:flutter/material.dart';
import 'package:guiadolider/view/login/login.dart';

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Navega para a tela inicial ao pressionar o botão voltar do celular
        Navigator.pushReplacementNamed(context, '/home');
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Perfil', style: TextStyle(color: Color(0XFFFFE45C))),
          backgroundColor: Color(0xFF5281B3),
          centerTitle: true,
        ),
        backgroundColor: Color(0xFF4C5E72),
        body: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              double cardWidth = constraints.maxWidth * 0.8;
              double fontSize = constraints.maxWidth * 0.04;
              double margin = constraints.maxWidth * 0.04;
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      color: Color(0xFF5281B3),
                      margin: EdgeInsets.all(margin),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          width: cardWidth,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Nome: Nome Exemplo',
                                style: TextStyle(
                                  color: Colors.yellow,
                                  fontSize: fontSize,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Email: email123@gmail.com',
                                style: TextStyle(
                                  color: Colors.yellow,
                                  fontSize: fontSize,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Senha: ********',
                                style: TextStyle(
                                  color: Colors.yellow,
                                  fontSize: fontSize,
                                ),
                              ),
                              SizedBox(height: 8),
                              GestureDetector(
                                onTap: () => _showChangePasswordDialog(context),
                                child: Text(
                                  'Alterar senha',
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: fontSize * 0.875,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.orange
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          '/',
                        );
                      },
                      child: Text('Encerrar sessão'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[600], // Cor de fundo do botão
                        foregroundColor: Colors.white, // Cor do texto do botão
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _showChangePasswordDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController currentPasswordController =
            TextEditingController();
        TextEditingController newPasswordController = TextEditingController();
        final _formKey = GlobalKey<FormState>();

        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Alterar senha'),
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Icon(Icons.close),
              ),
            ],
          ),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: currentPasswordController,
                  decoration: InputDecoration(labelText: 'Senha atual'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira sua senha atual';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: newPasswordController,
                  decoration: InputDecoration(labelText: 'Nova senha'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira sua nova senha';
                    }
                    if (value == currentPasswordController.text) {
                      return 'A nova senha não pode ser a mesma que a senha atual';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Lógica para alterar a senha
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Senha alterada com sucesso',
                        style: TextStyle(color: Colors.white), // Cor do texto
                      ),
                      backgroundColor: Colors.green, // Cor da barra
                      duration: Duration(seconds: 3),
                    ),
                  );
                }
              },
              child: Text('Alterar senha'),
            ),
          ],
        );
      },
    );
  }
}
