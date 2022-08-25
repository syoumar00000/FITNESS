import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:healthyapp/component/exercise_hub.dart';
import 'package:healthyapp/screens/exercise_screen.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class ExerciseStartScreen extends StatefulWidget {
  final Exercises exercises;
  const ExerciseStartScreen({Key? key, required this.exercises})
      : super(key: key);

  @override
  State<ExerciseStartScreen> createState() => _ExerciseStartScreenState();
}

class _ExerciseStartScreenState extends State<ExerciseStartScreen> {
  int seconds = 10;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Hero(
            tag: widget.exercises.id!,
            child: Stack(
              children: <Widget>[
                CachedNetworkImage(
                  imageUrl: widget.exercises.thumbnail!,
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
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0xFF000000),
                      Color(0x00000000),
                    ], begin: Alignment.bottomCenter, end: Alignment.center),
                  ),
                ),
                Positioned(
                  bottom: 40,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 4,
                    width: MediaQuery.of(context).size.width / 4,
                    child: SleekCircularSlider(
                      appearance: const CircularSliderAppearance(),
                      onChange: (double value) {
                        seconds = value.toInt();
                      },
                      initialValue: 30,
                      min: 10,
                      max: 60,
                      innerWidget: (v) {
                        return Container(
                          alignment: Alignment.center,
                          child: Text(
                            "${v.toInt()} Secondes",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    child: const Text(
                      "Start Exercise",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExerciseScreen(
                            exercises: widget.exercises,
                            seconds: seconds,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      onPrimary: Colors.black,
                      primary: const Color(0xFFE83350),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
              ],
            ),
            /* Image(
              image: NetworkImage(widget.exercises.thumbnail!),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ), */
          ),
        ),
      ),
    );
  }
}
