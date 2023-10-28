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
          )
        ),
      
      //backgroundColor: const Color.fromARGB(255, 68, 20, 88),
      child: SafeArea(
        child: Center(
          child: Column(
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
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Divider(color: AppTheme.colors.white,
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
                  style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 18),              
                ),
                ]
              )
            ),
            
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
                  style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 18),              
                ),
                ]
              )
            ),
            
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
                  style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 18),              
                ),
                ]
              )
            ),
            
            MyTextField(
              controller: confirmPasswordController,
              hintText: '...',
              obscureText: false,
            ),
            const SizedBox(height: 50),

            //Registrar 1/2
            MyButtom(
              Texto: '1/2   REGISTRAR', 
              onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Register2(emailController: emailController.text, passwordController: passwordController.text,),
                  ));
                  }
            ),
            const SizedBox(height: 10),
            
            ]
          ),
        ),
      ),
    )
  );

  }

}