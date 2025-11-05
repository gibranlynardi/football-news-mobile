import 'package:flutter/material.dart';
// Mengimpor MyHomePage dari lokasi barunya di dalam folder 'screens'
import 'package:football_news/screens/menu.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // Tema utama aplikasi
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(secondary: Colors.blueAccent[400]),
        useMaterial3: true,
      ),
      // Halaman awal aplikasi
      home: const MyHomePage(),
    );
  }
}