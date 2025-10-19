import 'package:flutter/material.dart';

/// A placeholder for the main home screen of the application.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Center(
        child: Text('Welcome to ComicsVerse!'),
      ),
    );
  }
}

