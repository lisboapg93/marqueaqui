import 'package:flutter/material.dart';

class AdicaoPage extends StatefulWidget {
  const AdicaoPage({Key? key}) : super(key: key);

  @override
  State<AdicaoPage> createState() => _AdicaoPageState();
}

class _AdicaoPageState extends State<AdicaoPage> {
  DateTime _date = DateTime(2020, 11, 17);

  void _selectDate() async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2017, 1),
      lastDate: DateTime(2022, 7),
      helpText: 'Select a date',
    );
    if (newDate != null) {
      setState(() {
        _date = newDate;
      });
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                onChanged: (value) {
                  setState(() {});
                },
                decoration: const InputDecoration(
                  labelText: 'Consulta/Exame',
                ),
              ),
              ElevatedButton(
                onPressed: _selectDate,
                child: const Text('SELECT DATE'),
              ),
              const SizedBox(height: 8),
              Text(
                'Selected date: $_date',
              ),
            ],
          ),
        ),
      );
    }
  }
}
