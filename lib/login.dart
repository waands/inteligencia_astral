import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:inteligencia_astral/components/my_buttom.dart';
import 'package:inteligencia_astral/components/switch.dart';
import 'package:inteligencia_astral/components/text_field.dart';

class Login extends StatelessWidget {
  Login({super.key});

  //text editing controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 68, 20, 88),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            const SizedBox(height: 50),
            //logo
            Image.asset('lib/imgs/logo.png'),

            const SizedBox(height: 25),

            //Inteligencia Astral
            const Text(
              "Inteligência Astral",
              style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 32),
            ),
            const SizedBox(height: 25),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Divider(color: Colors.white,
                             thickness: 2,
              ),
            ),

            const SizedBox(height: 25),

            //Bem vindo
            const Text(
              "Bem Vindo!",
              style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16),
            ),

            const SizedBox(height: 50),

            //email
            MyTextField(
              controller: usernameController,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children:[
                  Text(
                    'Esqueceu a senha?',
                    style: TextStyle(color: Colors.grey[400])
                  ),
                ]
              ),
            ),
            const SizedBox(height: 50),

            //mantenha conectado
             const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children:[              
                  SwitchExample(),
                  Text(
                    'Mantenha-me conectado',
                    style: TextStyle(color: Colors.white),
                  )
                ]
              ),
             ),
            const SizedBox(height: 25),

            //login
            MyButtom(
              Texto: 'LOGIN', 
              onTap: signUserIn,
            ),
            const SizedBox(height: 50),

            //increver
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Novo aqui? ",
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
                SizedBox(width: 4),
                Text(
                  "REGISTRE-SE",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                ),
            ],
            )
          ]),
        ),
      ),
    );
  }
}
