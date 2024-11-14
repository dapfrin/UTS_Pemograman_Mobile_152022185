import 'package:flutter/material.dart';

class KalkulatorBmiPage extends StatefulWidget {
  const KalkulatorBmiPage({super.key}); // Gunakan Key? agar lebih jelas

  @override
  _KalkulatorBmiPageState createState() => _KalkulatorBmiPageState();
}

class _KalkulatorBmiPageState extends State<KalkulatorBmiPage> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _bmiCategory = '';

  void _calculateBMI() {
    double height = double.tryParse(_heightController.text) ?? 0;
    double weight = double.tryParse(_weightController.text) ?? 0;

    if (height > 0 && weight > 0) {
      setState(() {
        double heightInMeters = height / 100; // Konversi tinggi ke meter
        _bmiResult = weight / (heightInMeters * heightInMeters);

        if (_bmiResult < 18.5) {
          _bmiCategory = 'Underweight';
        } else if (_bmiResult >= 18.5 && _bmiResult < 24.9) {
          _bmiCategory = 'Normal';
        } else if (_bmiResult >= 25 && _bmiResult < 29.9) {
          _bmiCategory = 'Overweight';
        } else {
          _bmiCategory = 'Obese';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator BMI'),
        backgroundColor: const Color.fromARGB(255, 37, 30, 233),
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
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
              'Tinggi Badan (cm)',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Masukkan tinggi badan Anda',
                hintStyle: TextStyle(color: Colors.white70),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Berat Badan (kg)',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Masukkan berat badan Anda',
                hintStyle: TextStyle(color: Colors.white70),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateBMI,
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.black, // Tombol Hitung BMI sekarang hitam
              ),
              child: const Text(
                'Hitung BMI',
                style: TextStyle(color: Colors.white), // Teks tombol putih
              ),
            ),
            const SizedBox(height: 20),
            // Hasil BMI dengan background agar tidak tertutup
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
              decoration: BoxDecoration(
                color:
                    Colors.black.withOpacity(0.7), // Background semi-transparan
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Hasil BMI: ${_bmiResult.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            // Kategori BMI dengan background agar tidak tertutup
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
              decoration: BoxDecoration(
                color:
                    Colors.black.withOpacity(0.7), // Background semi-transparan
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Kategori: $_bmiCategory',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
