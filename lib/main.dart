import 'package:flutter/material.dart';
import 'package:homehome/Screens/screen_a.dart';

void main() {
  runApp(
    MaterialApp(
      title: "こんにちは！お疲れ様です！",
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("こんにちは！お疲れ様です！"),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(height:100),
                Container(
                  color: Colors.amber,
                  child: Text("いつもお疲れ様です。"),
                ),
                Container(
                  color: Colors.blue,
                      child: Text("たまには悩みを吐き出しましょう！")
                )
              ],
            ),
            Container(
              child: Text("このアプリはあなたの悩みに対して褒めます。"),
            ),
            SizedBox(height:100),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return ScreenA();
                  }),
                );
              },
              child: Text("悩みを聞かせてね！"),
            ),
          ],
        ),
      ),
    );
  }
}
