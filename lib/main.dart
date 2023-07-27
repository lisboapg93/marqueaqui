import 'pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ConsultaMarcada());
}

class ConsultaMarcada extends StatelessWidget {
  const ConsultaMarcada({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consulta Marcada',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green
      ),
      home: HomePage(key: key),
    );
  }
}
