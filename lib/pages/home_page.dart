import 'package:flutter/material.dart';
import 'package:marqueaqui/pages/adicao_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _savedDate = DateTime(2020, 11, 17); // Variável para armazenar a data salva
  final String _specialidade = ''; // Variável para armazenar a especialidade

  @override
  void initState() {
    super.initState();
    _loadSelectedDate();
  }

  Future<void> _loadSelectedDate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? selectedDateStr = prefs.getString('selectedDate');
    if (selectedDateStr != null) {
      setState(() {
        _savedDate = DateTime.parse(selectedDateStr);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Consulta Marcada'),
        titleSpacing: 0.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        elevation: 0.0,
        actions: [
          IconButton(
            icon: const Icon(Icons.add, size: 35),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) =>  AdicaoPage()
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(
            height: 50,decoration: BoxDecoration(
              border: Border.all(
                width: 3, 
                color: const Color.fromARGB(255, 54, 189, 54)
                ),
                borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 54, 189, 54),
            ),
            child: Column(
              // Use um Column para organizar os Text widgets verticalmente
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Data Salva: ${DateFormat('dd/MM/yyyy').format(_savedDate)}'),
                Text('Especialidade: $_specialidade'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
