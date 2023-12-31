import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:inteligencia_astral/pages/chat.dart';
import 'package:inteligencia_astral/backend/authentication.dart';
import '/theme.dart';
import 'package:inteligencia_astral/pages/register.dart';
import 'package:inteligencia_astral/components/my_buttom.dart';
import 'package:inteligencia_astral/components/switch.dart';
import 'package:inteligencia_astral/components/text_field.dart';

class Login extends StatelessWidget {
  Login({super.key});

  //text editing controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn(BuildContext context) async {
    AuthenticationService authService = AuthenticationService();
    try {
      await authService.login(
          email: emailController.text, password: passwordController.text);
      // Navigate to Chat if login is successful
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Chat(),
      ));
    } catch (error) {
      // Show error to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (AuthenticationService().isLoggedIn()) {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Chat(),
        ));
      });
      return SizedBox
          .shrink(); // or some other temporary widget until navigation is complete
    }
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [AppTheme.colors.roxo1, AppTheme.colors.roxo2],
      )),

      //backgroundColor: const Color.fromARGB(255, 68, 20, 88),
      child: SafeArea(
        child: Stack(children: [
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
                style: TextStyle(color: AppTheme.colors.white, fontSize: 32),
              ),
              const SizedBox(height: 25),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Divider(
                  color: AppTheme.colors.white,
                  thickness: 2,
                ),
              ),

              const SizedBox(height: 25),

              //Bem vindo
              Text(
                "Bem Vindo!",
                style: TextStyle(color: AppTheme.colors.white, fontSize: 16),
              ),

              const SizedBox(height: 50),

              //email
              MyTextField(
                controller: emailController,
                hintText: 'email',
                obscureText: false,
              ),
              const SizedBox(height: 10),

              //senha
              MyTextField(
                controller: passwordController,
                hintText: 'senha',
                obscureText: true,
              ),

              //esqueceu a senha
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text('Esqueceu a senha?',
                      style: TextStyle(color: Colors.grey[400])),
                ]),
              ),
              const SizedBox(height: 50),

              //mantenha conectado
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  SwitchExample(),
                  Text(
                    'Mantenha-me conectado',
                    style: TextStyle(color: Colors.white),
                  )
                ]),
              ),
              const SizedBox(height: 25),
            ],
          ),

          // login
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: MyButtom(
                    Texto: 'LOGIN',
                    onTap: () {
                      signUserIn(context);
                    },
                  ),
                ),
                const SizedBox(height: 20),
                // inscrever
                RichText(
                  text: TextSpan(children: <TextSpan>[
                    const TextSpan(
                      text: 'Novo aqui? ',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextSpan(
                      text: 'REGISTRE-SE',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Register(),
                          ));
                        },
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ]),
      ),
    ));
  }
}
