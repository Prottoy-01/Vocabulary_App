import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Synonym extends StatefulWidget {
  final String word;
  const Synonym({super.key, required this.word});

  @override
  State<Synonym> createState() => _SynonymState();
}

class _SynonymState extends State<Synonym> {
  List<Map<String, dynamic>> synonyms = [];
  @override
  void initState() {
    super.initState();
    synonymApiCall();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Synonyms for "${widget.word}"')),
      body: ListView.separated(
        itemCount: synonyms.length,

        itemBuilder: (context, index) {
          return ListTile(
            title: Text(synonyms[index]['word'] ?? 'No synonym found'),
            subtitle: Text(synonyms[index]['score']?.toString() ?? ''),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(color: Colors.grey, height: 1);
        },
      ),
    );
  }

  Future<void> synonymApiCall() async {
    // Simulate an API call to fetch synonyms
    final link = 'https://api.datamuse.com/words?ml=${widget.word}';
    var uri = Uri.parse(link);
    var response = await http.get(uri);
    var data = response.body;
    var json = jsonDecode(data);
    setState(() {
      synonyms = List<Map<String, dynamic>>.from(json);
    });
  }
}
