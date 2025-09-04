import 'package:flutter/material.dart';
import 'pages/entry_page.dart';
import 'pages/list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQLite Demo',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SQLite App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Add Entry'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const EntryPage()),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('View Entries'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ListPage()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}