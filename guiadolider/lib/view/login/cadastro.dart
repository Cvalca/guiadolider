import 'package:flutter/material.dart';
import 'login.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _formKey = GlobalKey<FormState>();
  late String _name, _email, _password, _confirmPassword;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro', style: TextStyle(color: Color(0XFFFFE45C))),
        backgroundColor: Color(0xFF5281B3),
        centerTitle: true,
        iconTheme: IconThemeData(color: Color(0XFFFFE45C)),
      ),
      backgroundColor: Color(0xFF4C5E72),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double paddingHorizontal = constraints.maxWidth * 0.05;
            double paddingVertical = constraints.maxHeight * 0.05;
            double formFieldHeight = constraints.maxHeight * 0.08;

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Center(
                        child: Image.asset(
                          'assets/images/logo-login.png',
                          height: constraints.maxHeight * 0.2,
                        ),
                      ),
                      SizedBox(height: paddingVertical),
                      _buildTextFormField(
                        label: 'Nome',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira seu nome';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: formFieldHeight),
                      _buildTextFormField(
                        label: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira seu email';
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Por favor, insira um email válido';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: formFieldHeight),
                      _buildTextFormField(
                        label: 'Senha',
                        controller: _passwordController,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira sua senha';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _password = value!;
                        },
                      ),
                      SizedBox(height: formFieldHeight),
                      _buildTextFormField(
                        label: 'Confirmar Senha',
                        controller: _confirmPasswordController,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, confirme sua senha';
                          }
                          if (value != _passwordController.text) {
                            return 'As senhas não coincidem';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: paddingVertical),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            // Limpa o campo de senha após o cadastro ser realizado
                            _passwordController.clear();
                            _confirmPasswordController.clear();
                            // Ação ao cadastrar (apenas para visualização)
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Cadastro realizado com sucesso')),
                            );
                          }
                        },
                        child: Text('Cadastrar'),
                      ),
                      SizedBox(height: paddingVertical),
                      TextButton(
                        onPressed: () {
                          // Ação ao voltar para a tela de login
                          Navigator.pop(context);
                        },
                        child: Text('Já tem uma conta? Faça login'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required String label,
    TextEditingController? controller,
    TextInputType? keyboardType,
    bool obscureText = false,
    FormFieldValidator<String>? validator,
    FormFieldSetter<String>? onSaved,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Color(0XFFFFE45C)),
        hintStyle: TextStyle(color: Color(0XFFFFE45C)),
        border: OutlineInputBorder(),
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: TextStyle(color: Colors.white),
      validator: validator,
      onSaved: onSaved,
    );
  }
}
