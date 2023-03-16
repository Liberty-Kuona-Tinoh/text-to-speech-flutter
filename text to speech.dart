import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Text-to-Speech Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();
  final FlutterTts flutterTts = FlutterTts();

  Future<void> speak(String text) async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Text-to-Speech Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: 'Enter text to speak',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                speak(_textEditingController.text);
              },
              child: Text('Speak'),
            ),
          ],
        ),
      ),
    );
  }
}