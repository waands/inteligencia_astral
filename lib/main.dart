import 'package:flutter/material.dart';
import 'package:inteligencia_astral/pages/login.dart';

void main(){
  runApp(MaterialApp(
    home: myApp(),
  ));
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //home: CriarGrupo()
        home: Login());
  }
  //_PrimeiraTelaState createState() => _PrimeiraTelaState();
}
/*
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
*/


