import 'package:flutter/material.dart';
import 'package:learn_vocabulary_app/antonym.dart';

import 'package:learn_vocabulary_app/synonym.dart';

class ChoosePage extends StatefulWidget {
  final String word;
  const ChoosePage({super.key, required this.word});

  @override
  State<ChoosePage> createState() => _ChooseState();
}

class _ChooseState extends State<ChoosePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Choose an option for "${widget.word}"')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to HomePage with the entered word
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Synonym(word: widget.word),
                  ),
                );
              },
              child: const Text('View Synonyms'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Antonym(word: widget.word),
                  ),
                );
                // Navigate to another page or perform another action
              },
              child: const Text('View Antonyms'),
            ),
          ],
        ),
      ),
    );
  }
}
