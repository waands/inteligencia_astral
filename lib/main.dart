import 'package:flutter/material.dart';
import 'package:inteligencia_astral/pages/login.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://falskcwrckeclchnrsqh.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZhbHNrY3dyY2tlY2xjaG5yc3FoIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTg1MTY4OTcsImV4cCI6MjAxNDA5Mjg5N30.EFvjMHZqtRpwor6OVsS8x-sxVsxIfv8u0AgQ0qSFvw0',
  );

  runApp(MaterialApp(
    home: myApp(),
  ));
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Login());
  }
}

// Get a reference your Supabase client
final supabase = Supabase.instance.client;
