import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widgets Demo',
      theme: ThemeData(
        colorSchemeSeed: Colors.purple,
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text(
          'Welcome to your stock market tracker!, my name is Ola',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const Column(
        children: [
          Text(
            "Today's value: \$1000",
            key: ValueKey('todayValue'),
          ),
          Text(
            'Revenue/Loss: +5%',
            key: ValueKey('revenueLoss'),
          ),
          Column(
            children: [
              Text('Company 1: \$300'),
              Text('Company 2: \$400'),
              Text('Company 3: \$300'),
            ],
          ),
        ],
      ),
    );
  }
}