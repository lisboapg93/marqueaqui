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

  // List<String> _values = ['One', 'Two', 'Three', 'Four', 'Five'];

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
            bottomLeft: Radius.circular(25),
          ),
        ),
        elevation: 0.0,
        actions: [
          IconButton(
            icon: const Icon(Icons.add, size: 35),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AdicaoPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView.separated(
          itemCount: _specialidade.length,
          padding: const EdgeInsets.all(5.0),
          separatorBuilder: (context, index) => const Divider(
            color: Colors.black,
          ),
          itemBuilder: (context, index) {
            return Dismissible(
              key: Key('Especialidade: $_specialidade'),
              background: Container(
                color: Colors.red,
                child: const Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Icon(Icons.delete, color: Colors.white),
                    ],
                  ),
                ),
              ),
              onDismissed: (DismissDirection direction) {
                setState(() {
                  _specialidade.remove(_specialidade);
                });
              },
              child: ListTile(
                leading: const Icon(Icons.local_activity, size: 50),
                title: Text(_specialidade[index]),
                subtitle: Text('Data Salva: ${DateFormat('dd/MM/yyyy').format(_savedDate)}'),
              ),
            );
          },
        ),
      ),
    );
  }
}