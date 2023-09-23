import 'package:flutter/material.dart';
import 'package:inteligencia_astral/login.dart';

void main(){
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/login": (context) => Login(),
    },
    home: PrimeiraTela(),
  ));
}

class PrimeiraTela extends StatefulWidget {
  @override
  _PrimeiraTelaState createState() => _PrimeiraTelaState();
}

class _PrimeiraTelaState extends State<PrimeiraTela> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Primeira Tela"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              child: Text("Ir para a segunda tela"),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  "/login",
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}



