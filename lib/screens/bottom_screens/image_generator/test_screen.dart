import 'package:flutter/material.dart';

class MyScreen extends StatefulWidget {
  const MyScreen({Key? key}) : super(key: key);

  @override
  test_screen createState() => test_screen();
}

class test_screen extends State<MyScreen> {
  DateTime? _lastPressedAt;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_lastPressedAt == null ||
            DateTime.now().difference(_lastPressedAt!) > const Duration(seconds: 1)) {
          // Show a snackbar to inform the user that they can double tap to exit
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Tap again to exit')),
          );
          // Record the time of this press event
          _lastPressedAt = DateTime.now();
          // Do not close the app
          return false;
        }
        // Close the app
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Screen'),
        ),
        body: const Center(
          child: Text('Press back button to exit'),
        ),
      ),
    );
  }
}
