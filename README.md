# Demo03 – Introduction to Flutter and Basic Widgets

**Total: 100 points**

## Step 1 – Create and Open the Flutter Project (10 points)

Accept the invitation, Clone Demo03 github link, then Create new project and open it in Visual Studio code:

```bash
flutter create stock_tracker_lab
cd stock_tracker_lab
```

In Visual Studio code, select **Open**, then choose the `stock_tracker_lab` directory.

Create the first commit:

```bash
git init
git add .
git commit -m "Initial project"
```

## Step 2 – Create the Basic Material App (10 points)

Replace the contents of `lib/main.dart` with the following code:

```dart
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
        title: const Text('Widgets Demo'),
      ),
      body: const Center(
        child: Text('Widgets Basics'),
      ),
    );
  }
}
```

Run the application:

```bash
flutter run
```

Verify that **Widgets Basics** appears, then commit the change:

```bash
git add .
git commit -m "Added basic MaterialApp"
```

## Step 3 – Update the App Bar Title (10 points)

Replace the current `AppBar` with:

```dart
appBar: AppBar(
  title: const Text('Welcome to your stock market tracker!, my name is YourName'),
),
```
 then add Light blue as appBar background color and white as text color.

Save and run the application. Verify that the greeting and your name appears in the app bar, then commit the change:

```bash
git add .
git commit -m "Updated greeting in app bar"
```

## Step 4 – Explore the Widget Tree (10 points)

Run the application in debug mode. In Visual Studio code, select **View → Command Palette → Open Flutter DevTools Widget Inspector**.

Expand the widget tree and identify this relationship:

```text
MaterialApp → Scaffold → AppBar → Text
```

Modify a UI widget and verify that the widget tree updates. 

Take a screenshot of the widget tree. Save it in a new folder named “Screenshots.”

## Step 5 – Add the Stock Information Widgets (10 points)

Replace the `body` of `MyHomePage` with:

```dart
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
```

Run the application and verify that today's value, revenue/loss, and the three company values appear. Commit the change:

```bash
git add .
git commit -m "Added basic stock information widgets"
```

## Step 6 – Style the Today’s Value Card (10 points)

Wrap the **Today’s value** text in a `Container`. Give the container a `Colors.purpleAccent` background and rounded corners with a radius of `16`.

samples
```dart
Container(
      decoration: BoxDecoration(
        color: Colors.purpleAccent,
        borderRadius: BorderRadius.circular(16),
      ),
```
```dart
 child: const Text(
        "Today's value: \$1000",
        key: ValueKey('todayValue'),
      ),
       ),
```

run the code then
```bash
git add .
git commit -m "Styled today's value card"
```

## Step 7 – Create the AnalyticsButton Widget (10 points)

Add the following code below `MyHomePage` in `lib/main.dart`:

```dart
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
          child: const Text('Show Analytics'),
        ),
        if (_showAnalytics)
          const Text('Detailed analytics go here...'),
      ],
    );
  }
}
```

## Step 8 – Add and Test AnalyticsButton (10 points)

Add `AnalyticsButton` as a child of the main `Column`, below the stock information in the MyHomePage class:

```dart
const AnalyticsButton(),
```

Run the application. Press **Show Analytics** and verify that the analytics text appears and disappears. Commit the change:

```bash
git add .
git commit -m "Added AnalyticsButton with gesture handling"
```

## Step 9 – Create CompanyValues and Handle Its Lifecycle (10 points)

Add these imports at the top of `lib/main.dart`:

```dart
import 'dart:async';
import 'dart:math';
```

Add the following widget below `AnalyticsButton`:

```dart
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
```

## Step 10 – Use CompanyValues and Test the Final App (10 points)

Remove the fixed `Column` containing the three company values and insert this widget in the same position:

```dart
const CompanyValues(),
```

Run the application and verify that:

- The company values change every second.
- The styled Today’s Value card appears.
- The **Show Analytics** button shows and hides the analytics text.

Commit the final changes:

```bash
git add .
git commit -m "Implemented CompanyValues with lifecycle events"
```
