import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math';

import 'package:kiddo/core/assets/assets.dart';

import '../../controller/controller.dart';

class ColorGame extends StatefulWidget {
  const ColorGame({Key? key}) : super(key: key);

  @override
  createState() => ColorGameState();
}

class ColorGameState extends State<ColorGame> {
  /// Map to keep track of score
  final Map<String, bool> score = {};

  /// Choices for game
  final Map choices = {
    '🍏': Colors.green,
    '🍋': Colors.yellow,
    '🍅': Colors.red,
    '🍇': Colors.purple,
  };

  // Random seed to shuffle order of items.
  int seed = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFFF5BE),
        centerTitle: true,
        elevation: 2,
        shadowColor: const Color(0xffFFED8C),
        title: Text('النتيجة ${score.length} / 4'),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 2,
        backgroundColor: const Color(0xffFFED8C),
        child: const Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            score.clear();
            seed++;
          });
        },
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: choices.keys.map((emoji) {
                return Draggable<String>(
                  data: emoji,
                  feedback: Emoji(emoji: emoji),
                  childWhenDragging: const Emoji(emoji: '🌱'),
                  child: Emoji(emoji: score[emoji] == true ? '✅' : emoji),
                );
              }).toList()),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
                choices.keys.map((emoji) => _buildDragTarget(emoji)).toList()
                  ..shuffle(Random(seed)),
          )
        ],
      ),
    );
  }

  Widget _buildDragTarget(emoji) {
    return DragTarget(
      onWillAccept: (data) => data == emoji,
      onAccept: (data) {
        setState(() {
          score[emoji] = true;
          successAudio();
      
        });
      },
      builder: (BuildContext context, List<Object?> candidateData,
          List<dynamic> rejectedData) {
        if (score[emoji] == true) {
          return Container(
            color: Colors.white,
            alignment: Alignment.center,
            height: 70.h,
            width: 200.w,
            child: const Text('ممتاز!'),
          );
        } else {
          return Container(color: choices[emoji], height: 80.h, width: 200.w);
        }
      },
    );
  }
}

class Emoji extends StatelessWidget {
  const Emoji({Key? key, required this.emoji}) : super(key: key);

  final String emoji;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        height: 100,
        padding: const EdgeInsets.all(10),
        child: Text(
          emoji,
          style: const TextStyle(color: Colors.black, fontSize: 50),
        ),
      ),
    );
  }
}
