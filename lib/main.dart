import 'package:flutter/material.dart';
import 'package:rnd_image_filters/test_page_1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'rnd_image_filters',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TestPage1(),
    );
  }
}
