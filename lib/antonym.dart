import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Antonym extends StatefulWidget {
  final String word;
  const Antonym({super.key, required this.word});

  @override
  State<Antonym> createState() => _AntonymState();
}

class _AntonymState extends State<Antonym> {
  List<Map<String, dynamic>> antonyms = [];
  @override
  void initState() {
    super.initState();
    antonymApiCall();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Antonyms for "${widget.word}"')),
      body: ListView.separated(
        itemCount: antonyms.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(antonyms[index]['word'] ?? 'No antonym found'),
            subtitle: Text(antonyms[index]['score']?.toString() ?? ''),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(color: Colors.grey, height: 1);
        },
      ),
    );
  }

  Future<void> antonymApiCall() async {
    // Simulate an API call to fetch antonyms
    final link = 'https://api.datamuse.com/words?rel_ant=${widget.word}';
    var uri = Uri.parse(link);
    var response = await http.get(uri);
    var data = response.body;
    var json = jsonDecode(data);
    setState(() {
      antonyms = List<Map<String, dynamic>>.from(json);
    });
  }
}
