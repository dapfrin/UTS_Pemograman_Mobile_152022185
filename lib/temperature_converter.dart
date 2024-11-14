import 'package:flutter/material.dart';

class TemperatureConversionScreen extends StatefulWidget {
  const TemperatureConversionScreen({super.key});

  @override
  _TemperatureConversionScreenState createState() =>
      _TemperatureConversionScreenState();
}

class _TemperatureConversionScreenState
    extends State<TemperatureConversionScreen> {
  // Variabel untuk menyimpan input dan output
  double _inputValue = 0;
  String _selectedInputUnit = 'Celsius';
  String _selectedOutputUnit = 'Fahrenheit';
  double _outputValue = 0;

  final List<String> _units = ['Celsius', 'Fahrenheit', 'Kelvin'];

  // Fungsi untuk konversi suhu
  void _convertTemperature() {
    setState(() {
      double celsius;

      // Konversi input ke Celsius
      switch (_selectedInputUnit) {
        case 'Fahrenheit':
          celsius = (_inputValue - 32) * 5 / 9;
          break;
        case 'Kelvin':
          celsius = _inputValue - 273.15;
          break;
        default: // Celsius
          celsius = _inputValue;
          break;
      }

      // Konversi dari Celsius ke output yang diinginkan
      switch (_selectedOutputUnit) {
        case 'Fahrenheit':
          _outputValue = celsius * 9 / 5 + 32;
          break;
        case 'Kelvin':
          _outputValue = celsius + 273.15;
          break;
        default: // Celsius
          _outputValue = celsius;
          break;
      }
    });
  }

  // Widget Dropdown untuk memilih satuan suhu
  Widget _buildDropdown(
      String label, String value, Function(String?) onChanged) {
    return DropdownButton<String>(
      value: value,
      icon: const Icon(Icons.arrow_downward, color: Colors.blueAccent),
      elevation: 16,
      style: const TextStyle(color: Colors.blueAccent), // Mengubah warna font
      underline: Container(
        height: 2,
        color: Colors.blueAccent,
      ),
      onChanged: onChanged,
      items: _units.map<DropdownMenuItem<String>>((String unit) {
        return DropdownMenuItem<String>(
          value: unit,
          child: Text(unit),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Konverter Suhu'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Nilai Input',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            const SizedBox(height: 10),
            // Input nilai suhu
            TextField(
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white24,
                hintText: 'Masukkan nilai',
                hintStyle: const TextStyle(color: Colors.white54),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _inputValue = double.tryParse(value) ?? 0;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Satuan Dari',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            const SizedBox(height: 10),
            // Dropdown untuk memilih satuan input
            _buildDropdown(
              'Satuan Dari',
              _selectedInputUnit,
              (value) {
                setState(() {
                  _selectedInputUnit = value!;
                  _convertTemperature();
                });
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Satuan Ke',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            const SizedBox(height: 10),
            // Dropdown untuk memilih satuan output
            _buildDropdown(
              'Satuan Ke',
              _selectedOutputUnit,
              (value) {
                setState(() {
                  _selectedOutputUnit = value!;
                  _convertTemperature();
                });
              },
            ),
            const SizedBox(height: 20),
            // Tombol untuk konversi
            ElevatedButton(
              onPressed: _convertTemperature,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                backgroundColor: Colors.white,
                foregroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
              ),
              child: const Text(
                'Konversi',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 30),
            // Hasil konversi
            Center(
              child: Text(
                'Nilai Output: $_outputValue $_selectedOutputUnit',
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
