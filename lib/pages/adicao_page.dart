import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';



class AdicaoPage extends StatefulWidget {
  const AdicaoPage({Key? key, required this.onSave}) : super(key: key);

  final Function(String) onSave;

  @override
  _AdicaoPageState createState() => _AdicaoPageState();
}


class _AdicaoPageState extends State<AdicaoPage> {
  String _eSpecialidade = '';
  DateTime _date = DateTime(2020, 11, 17);

  void _selectDate() async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2017, 1),
      lastDate: DateTime(2022, 7),
      helpText: '',
      locale: const Locale("pt", "BR"),
    );
    if (newDate != null) {
      setState(() {
        _date = newDate;
      });
      _saveSelectedDate(_date);
    }
  }

  Future<void> _saveSelectedDate(DateTime date) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedDate', date.toIso8601String());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    _eSpecialidade = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Consulta/Exame',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: ElevatedButton(
                onPressed: _selectDate,
                child: const Text('Selecione a data'),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Data Selecionada: ${DateFormat('dd/MM/yyyy').format(_date)}',
            ),
            Container(
              margin: const EdgeInsets.all(150),
              child: ElevatedButton(
                onPressed: () {
                  widget.onSave(_eSpecialidade); // Salvar _eSpecialidade
                  Navigator.pop(context);
                },
                child: const Text('SALVAR'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
