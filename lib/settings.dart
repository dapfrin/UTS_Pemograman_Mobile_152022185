import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key}); // Gunakan Key? agar lebih jelas

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDarkMode = false;

  // Fungsi untuk toggle mode gelap/terang
  void _toggleDarkMode(bool value) {
    setState(() {
      _isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan'),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Judul Pengaturan
            const Text(
              'Pengaturan Akun',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),

            // Opsi untuk mengganti nama pengguna
            ListTile(
              title: const Text(
                'Ubah Nama Pengguna',
                style: TextStyle(color: Colors.white),
              ),
              leading: const Icon(Icons.person, color: Colors.white),
              onTap: () {
                // Aksi untuk mengubah nama pengguna
              },
            ),
            const Divider(color: Colors.white24),

            // Opsi untuk mengganti kata sandi
            ListTile(
              title: const Text(
                'Ubah Kata Sandi',
                style: TextStyle(color: Colors.white),
              ),
              leading: const Icon(Icons.lock, color: Colors.white),
              onTap: () {
                // Aksi untuk mengubah kata sandi
              },
            ),
            const Divider(color: Colors.white24),

            // Opsi untuk mode gelap/terang
            ListTile(
              title: const Text(
                'Mode Gelap/Terang',
                style: TextStyle(color: Colors.white),
              ),
              leading: const Icon(Icons.brightness_6, color: Colors.white),
              trailing: Switch(
                value: _isDarkMode,
                onChanged: _toggleDarkMode,
                activeColor: Colors.blueAccent,
              ),
              onTap: () {
                // Men-toggle mode gelap/terang
              },
            ),
            const Divider(color: Colors.white24),

            // Opsi untuk logout
            ListTile(
              title: const Text(
                'Keluar',
                style: TextStyle(color: Colors.white),
              ),
              leading: const Icon(Icons.exit_to_app, color: Colors.white),
              onTap: () {
                // Aksi logout
              },
            ),
            const Divider(color: Colors.white24),
          ],
        ),
      ),
    );
  }
}
