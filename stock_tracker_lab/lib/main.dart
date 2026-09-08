import 'dart:async';
import 'dart:math';

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
      body: Column(
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
          CompanyValues(),
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

class CompanyValues extends StatefulWidget {
  const CompanyValues({super.key});

  @override
  State<CompanyValues> createState() => _CompanyValuesState();
}

class _CompanyValuesState extends State<CompanyValues> {
  final List<int> _companyValues = [300, 400, 300];
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _companyValues[0] += Random().nextInt(10) - 5;
        _companyValues[1] += Random().nextInt(10) - 5;
        _companyValues[2] += Random().nextInt(10) - 5;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Company 1: \$${_companyValues[0]}'),
        Text('Company 2: \$${_companyValues[1]}'),
        Text('Company 3: \$${_companyValues[2]}'),
      ],
    );
  }
}