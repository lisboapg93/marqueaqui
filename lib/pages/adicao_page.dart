import 'package:flutter/material.dart';

class AdicaoPage extends StatefulWidget {
  const AdicaoPage({Key? key}) : super(key: key);

  @override
  _AdicaoPageState createState() => _AdicaoPageState();
}

class _AdicaoPageState extends State<AdicaoPage> {
  DateTime _date = DateTime(2020, 11, 17);

  void _selectDate() async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2017, 1),
      lastDate: DateTime(2022, 7),
      helpText: '',
      locale: const Locale("pt", "BR")
    );
    if (newDate != null) {
      setState(() {
        _date = newDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {});
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
              'Data Selecionada: $_date',
            ),Container(
              margin: const EdgeInsets.all(150),
              child: ElevatedButton(
                  onPressed: () {
                    // Coloque aqui a lógica para salvar os dados
                  },
                  child: const Text('SALVAR'),
                ),
            ),
          ],
        ),
      )
    );
  }
}