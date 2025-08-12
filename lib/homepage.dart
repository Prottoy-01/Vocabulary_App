import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  final String word;
  const HomePage({super.key, required this.word});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> words = [];
  List<Map<String, dynamic>> antonyms = [];

  @override
  void initState() {
    super.initState();

    matchapicall();
    antonymapicall();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Learn Vocabulary App')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Word: ${widget.word}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Words that match your word:',
              style: TextStyle(fontSize: 18),
            ),
            ...words
                .map((word) => ListTile(title: Text(word['word'] ?? '')))
                .toList(),
            const SizedBox(height: 20),
            const Text('Antonyms:', style: TextStyle(fontSize: 18)),
            ...antonyms
                .map((antonym) => ListTile(title: Text(antonym['word'] ?? '')))
                .toList(),
          ],
        ),
      ),
    );
  }

  Future<void> matchapicall() async {
    final url = 'https://api.datamuse.com/words?ml=${widget.word}';
    var uri = Uri.parse(url);
    var response = await http.get(uri);
    var data = response.body;
    var json = jsonDecode(data);
    setState(() {
      words = List<Map<String, dynamic>>.from(json);
    });
  }

  Future<void> antonymapicall() async {
    final url = 'https://api.datamuse.com/words?rel_ant=${widget.word}';
    var uri = Uri.parse(url);
    var response = await http.get(uri);
    var data = response.body;
    var json = jsonDecode(data);
    setState(() {
      antonyms = List<Map<String, dynamic>>.from(json);
    });
  }
}
