import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Flutter Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SimplePage(),
    );
  }
}

class SimplePage extends StatelessWidget {
  const SimplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Page'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to the Simple Page!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              'This is a basic Flutter app.',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
