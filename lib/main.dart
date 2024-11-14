import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UTS Pemograman Mobile',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SplashScreen(), // Set SplashScreen sebagai halaman utama
      debugShowCheckedModeBanner: false,
    );
  }
}
