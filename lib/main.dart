import 'package:flutter/material.dart';
import 'Dart:math';

void main() {
  runApp(DiceApp());
}

class DiceApp extends StatelessWidget {
  const DiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          elevation: 1.0,
          title: const Text(
            'Dicee',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
        body: const DiceAppBody(),
      ),
    );
  }
}

class DiceAppBody extends StatefulWidget {
  const DiceAppBody({super.key});
  @override
  State<DiceAppBody> createState() => _DiceAppBodyState();
}

class _DiceAppBodyState extends State<DiceAppBody> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 5;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          ExpandedImage(
            image: 'images/dice$leftDiceNumber.png',
            callback: () {
              changeDiceFace();
            },
          ),
          ExpandedImage(
              image: 'images/dice$rightDiceNumber.png',
              callback: () {
                changeDiceFace();
              }),
        ],
      ),
    );
  }

  void changeDiceFace() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }
}

class ExpandedImage extends StatelessWidget {
  final String image;
  final VoidCallback callback;
  const ExpandedImage({super.key, required this.image, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          callback();
        },
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Image.asset(image),
        ),
      ),
    );
  }
}
