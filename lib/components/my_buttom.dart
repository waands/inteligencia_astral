import 'package:flutter/material.dart';

class MyButtom extends StatelessWidget {
  final Function()? onTap;
  final String Texto;
  const MyButtom({super.key, required this.Texto, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 165, 225, 208),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
              child: Text(
            Texto,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ))));
  }
}
