import 'package:flutter/material.dart';
import '../db_helper.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<Map<String, dynamic>> entries = [];

  void _loadEntries() async {
    final data = await DBHelper.getEntries();
    setState(() {
      entries = data;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadEntries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Entry List')),
      body: ListView.builder(
        itemCount: entries.length,
        itemBuilder: (context, index) {
          final entry = entries[index];
          return ListTile(
            title: Text(entry['title']),
            subtitle: Text('${entry['description']}\n${entry['date']} at ${entry['time']}'),
            isThreeLine: true,
          );
        },
      ),
    );
  }
}