import 'package:flutter/material.dart';
import 'package:homehome/Screens/screen_b.dart';

class ScreenA extends StatefulWidget {
  const ScreenA({super.key});

  @override
  State<ScreenA> createState() => _ScreenAState();
}

class _ScreenAState extends State<ScreenA> {
  String _inputText = "あなたの悩み";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("あなたの悩みを教えてください"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "悩みをここに書いてね",
                ),
                onChanged: (value) {
                  setState(() {
                    _inputText = value;
                  });
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("最初の画面に戻る"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ScreenB(textPassedFromScreenA: _inputText);
                }));
              },
              child: Text("悩みを書き終わったら押して下さい"),
            ),
            Text(_inputText)
          ],
        ));
  }
}
