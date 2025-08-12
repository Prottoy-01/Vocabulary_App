import 'package:flutter/material.dart';
import 'package:learn_vocabulary_app/chooose_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController wordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome to the Vocabulary App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: wordController,
              decoration: const InputDecoration(
                labelText: 'Enter a word to search',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to HomePage with the entered word
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChoosePage(word: wordController.text),
                  ),
                );
              },
              child: const Text('Search'),
            ),
          ],
        ),
      ),
    );
  }
}
