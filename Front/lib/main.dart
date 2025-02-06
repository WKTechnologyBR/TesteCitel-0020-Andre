import 'package:desafio_wk_technology/view/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Captação de sangue',
      debugShowCheckedModeBanner: false,
      home: HomePage(title: 'Captação de sangue'),
    );
  }
}
