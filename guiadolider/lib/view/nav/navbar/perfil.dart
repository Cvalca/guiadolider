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
            Card(
              color: Colors.blue[700],
              margin: EdgeInsets.all(16.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nome: Nome Exemplo',
                      style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Email: email123@gmail.com',
                      style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Senha: ********',
                      style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    GestureDetector(
                      onTap: () => _showChangePasswordDialog(context),
                      child: Text(
                        'Alterar senha',
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navegar para outra tela
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              child: Text('Encerrar sessão'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow, // Cor de fundo do botão
                foregroundColor: Colors.black,  // Cor do texto do botão
              ),
            ),
          ],
        ),
      ),
      // body: Center(
      //   child: Column(
      //    mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       ElevatedButton(
      //         onPressed: () {
      //           Navigator.pushReplacementNamed(
      //             context,
      //             '/',
      //           );
      //         },
      //         child: Text('Sair da conta'),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

  void _showChangePasswordDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController currentPasswordController = TextEditingController();
        TextEditingController newPasswordController = TextEditingController();
        final _formKey = GlobalKey<FormState>();

        return AlertDialog(
          title: Text('Alterar senha'),
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



class LogoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Você encerrou a sessão.'),
      ),
    );
  }
}