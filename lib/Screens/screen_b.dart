import 'package:flutter/material.dart';
import 'dart:math';

class ScreenB extends StatefulWidget {
  final String textPassedFromScreenA;

  const ScreenB({Key? key, required this.textPassedFromScreenA})
      : super(key: key);

  @override
  _ScreenBState createState() => _ScreenBState();
}

class _ScreenBState extends State<ScreenB> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  static const List<String> compliments = [
    'あなたは最高です！',
    'あなたは頑張っています！',
    '偉い！',
    'たまにはゆっくり休んで！',
    '今日は自分を甘やかしましょう！',
  ];

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );

    animation = Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(controller);

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final Random random = Random();
    final String randomCompliment =
        compliments[random.nextInt(compliments.length)];

    return Scaffold(
      appBar: AppBar(
        title: Text("褒めます！"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("あなたの悩みは消えて行きます！"),
            FadeTransition(
              opacity: animation,
              child: Text(
                "あなたの悩みは「${widget.textPassedFromScreenA}」です!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Text(
              " $randomCompliment",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose(); //アニメーションコントローラcontrollerを解放するためのコード
    super.dispose(); //Stateオブジェクトが不要になったときにdisposeメソッドを呼び出す
  } //つまり、アニメーション終了時に必要
}
