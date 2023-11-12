import 'package:flutter/material.dart';
import 'package:inteligencia_astral/pages/register2.dart';
import 'package:inteligencia_astral/components/text_field.dart';
import 'package:inteligencia_astral/components/my_buttom.dart';
import '/theme.dart';

class Register extends StatelessWidget {
  Register({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppTheme.colors.roxo1, AppTheme.colors.roxo2],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  //logo
                  Image.asset('lib/imgs/logo.png'),

                  const SizedBox(height: 25),

                  //Inteligencia Astral
                  Text(
                    "Inteligência Astral",
                    style:
                        TextStyle(color: AppTheme.colors.white, fontSize: 32),
                  ),
                  const SizedBox(height: 25),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Divider(
                      color: AppTheme.colors.white,
                      thickness: 2,
                    ),
                  ),

                  const SizedBox(height: 25),

                  //REGISTRE-SE
                  const Text(
                    "REGISTRE-SE",
                    style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16),
                  ),
                  const SizedBox(height: 50),

                  //Email
                  const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Email",
                              style: TextStyle(
                                  color: Color(0xFFFFFFFF), fontSize: 18),
                            ),
                          ])),

                  MyTextField(
                    controller: emailController,
                    hintText: '...',
                    obscureText: false,
                  ),
                  const SizedBox(height: 20),

                  //Senha
                  const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Senha",
                              style: TextStyle(
                                  color: Color(0xFFFFFFFF), fontSize: 18),
                            ),
                          ])),

                  MyTextField(
                    controller: passwordController,
                    hintText: '...',
                    obscureText: false,
                  ),
                  const SizedBox(height: 20),

                  //Confirmar senha
                  const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Confirmar senha",
                              style: TextStyle(
                                  color: Color(0xFFFFFFFF), fontSize: 18),
                            ),
                          ])),

                  MyTextField(
                    controller: confirmPasswordController,
                    hintText: '...',
                    obscureText: false,
                  ),
                  const SizedBox(height: 50),
                ],
              ),
              // Registrar 1/2

              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Container(
                  width: double.infinity,
                  child: MyButtom(
                    Texto: '1/2   REGISTRAR',
                    onTap: () {
                      if (validateRegistrationFields(
                        emailController.text,
                        passwordController.text,
                        confirmPasswordController.text,
                        context,
                      )) {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Register2(
                            emailController: emailController.text,
                            passwordController: passwordController.text,
                          ),
                        ));
                      }
                    },
                  ),
                ),
              ),
            ],
          ),

          //const SizedBox(height: 10),
        ),
      ),
    );
  }

  bool validateRegistrationFields(String email, String password,
      String confirmPassword, BuildContext context) {
    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      // Campos não preenchidos, exibir mensagem de erro
      _showErrorDialog(context, "Por favor, preencha todos os campos.");
      return false;
    }

    if (!isValidEmail(email)) {
      // E-mail inválido, exibir mensagem de erro
      _showErrorDialog(context, "Por favor, insira um e-mail válido.");
      return false;
    }

    if (password.length < 6) {
      // Senhas com menos de 6 dígitos, exibir mensagem de erro
      _showErrorDialog(
          context, "As senhas devem possuir pelo menos 6 dígitos.");
      return false;
    }

    if (password != confirmPassword) {
      // Senhas diferentes, exibir mensagem de erro
      _showErrorDialog(context, "As senhas não coincidem. Tente novamente.");
      return false;
    }

    return true;
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Erro"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "OK",
                style: TextStyle(color: AppTheme.colors.roxo2),
              ),
            ),
          ],
        );
      },
    );
  }

  // Função para verificar se o e-mail tem um formato válido
  bool isValidEmail(String email) {
    // Pode ajustar a expressão regular conforme necessário
    final RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailRegex.hasMatch(email);
  }
}
