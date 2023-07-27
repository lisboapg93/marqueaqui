import 'package:flutter/material.dart';
import 'package:marqueaqui/pages/adicao_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Consulta Marcada'),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        elevation: 0.00,
        actions: [
          IconButton(
            icon: const Icon(Icons.add, size: 35),
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => const AdicaoPage()),
              );
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Sua lista de consultas e exames', 
        style: TextStyle(
          fontSize: 20,
          ),
        ),
      ),
    );
    
  }
}