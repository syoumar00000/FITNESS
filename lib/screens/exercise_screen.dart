import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:healthyapp/component/exercise_hub.dart';

class ExerciseScreen extends StatefulWidget {
  final Exercises exercises;
  final int? seconds;
  const ExerciseScreen({Key? key, required this.exercises, this.seconds})
      : super(key: key);

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  bool isCompleted = false;
  int elapsedSeconds = 0;
  late Timer timer;
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache();

  @override
  void initState() {
    timer = Timer.periodic(
        const Duration(
          seconds: 1,
        ), (t) {
      if (t.tick == widget.seconds) {
        t.cancel();
        setState(() {
          isCompleted = true;
        });
        audioPlayer.stop();
        playAudio();
      }
      setState(() {
        elapsedSeconds = t.tick;
        playMusic();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void playAudio() {
    audioPlayer.play(AssetSource("bip.mp3"));
  }

  void playMusic() {
    audioPlayer.play(AssetSource("music.mp3"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Center(
          child: CachedNetworkImage(
            imageUrl: widget.exercises.gif!,
            placeholder: (context, url) => Image(
              image: const AssetImage("assets/placeholder.png"),
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            errorWidget: (context, url, error) => const Icon(
              Icons.error,
            ),
            fit: BoxFit.cover,
            /* height: MediaQuery.of(context).size.height, */
            width: MediaQuery.of(context).size.width,
          ),
        ),
        isCompleted == false
            ? SafeArea(
                child: Container(
                  alignment: Alignment.topCenter,
                  child: Text("$elapsedSeconds/${widget.seconds} S"),
                ),
              )
            : Container(),
        SafeArea(
          child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close)),
        ),
      ],
    ));
  }
}
