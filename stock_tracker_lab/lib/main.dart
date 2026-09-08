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
          Container(
            decoration: BoxDecoration(
              color: Colors.purpleAccent,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Text(
              "Today's value: \$1000",
              key: ValueKey('todayValue'),
            ),
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
          AnalyticsButton(),
        ],
      ),
    );
  }
}
class AnalyticsButton extends StatefulWidget {
  const AnalyticsButton({super.key});

  @override
  State<AnalyticsButton> createState() => _AnalyticsButtonState();
}

class _AnalyticsButtonState extends State<AnalyticsButton> {
  bool _showAnalytics = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilledButton(
          onPressed: () {
            setState(() {
              _showAnalytics = !_showAnalytics;
            });
          },
          child: Text('Show Analytics'),
        ),
        if (_showAnalytics)
          const Text('Detailed analytics go here...'),
      ],
    );
  }
}