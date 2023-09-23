import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget{
  final controller;
  final String hintText;
  final bool obscureText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText
  });

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            filled: true,
            fillColor: const Color.fromARGB(255, 126, 111, 195),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: const Color.fromARGB(0, 255, 255, 255))),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[400]),      
        ),
        
      )
      
    );
  }
}