import 'package:flutter/material.dart';

class TemperatureConversionScreen extends StatefulWidget {
  @override
  _TemperatureConversionScreenState createState() => _TemperatureConversionScreenState();
}

class _TemperatureConversionScreenState extends State<TemperatureConversionScreen> {
  final _tempController = TextEditingController();
  String _convertedTemperature = '';
  String _conversionType = 'F to C'; // Default conversion type
  List<String> _history = [];

  void _convertTemperature() {
    double temp = double.tryParse(_tempController.text) ?? 0.0;
    double converted;

    if (_conversionType == 'F to C') {
      converted = (temp - 32) * 5 / 9;
      _convertedTemperature = '${temp.toStringAsFixed(2)} °F => ${converted.toStringAsFixed(2)} °C';
    } else {
      converted = (temp * 9 / 5) + 32;
      _convertedTemperature = '${temp.toStringAsFixed(2)} °C => ${converted.toStringAsFixed(2)} °F';
    }

    setState(() {
      _history.add(_convertedTemperature);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temperature Conversion'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: _tempController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Enter temperature',
            ),
          ),
          DropdownButton<String>(
            value: _conversionType,
            onChanged: (String? newValue) {
              setState(() {
                _conversionType = newValue!;
              });
            },
            items: <String>['F to C', 'C to F']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          ElevatedButton(
            onPressed: _convertTemperature,
            child: Text('Convert'),
          ),
          Text(
            _convertedTemperature,
            style: Theme.of(context).textTheme.headline6,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _history.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_history[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
