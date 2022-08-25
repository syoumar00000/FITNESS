import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:healthyapp/component/exercise_hub.dart';
import 'package:healthyapp/screens/exercise_start_screen.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String apiUrl =
      "https://raw.githubusercontent.com/codeifitech/fitness-app/master/exercises.json";
  ExerciseHub exerciseHub = ExerciseHub();

  @override
  void initState() {
    getExercises();
    super.initState();
  }

  void getExercises() async {
    var response = await http.get(Uri.parse(apiUrl));
    var body = response.body;
    var myJson = jsonDecode(body);
    exerciseHub = ExerciseHub();
    //ExerciseHub exerciseHub = ExerciseHub();
    setState(() {
      exerciseHub = ExerciseHub.fromJson(myJson);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FitNess App"),
      ),
      body: Container(
        child: (exerciseHub.exercises != null)
            ? ListView(
                children: exerciseHub.exercises!.map((e) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ExerciseStartScreen(exercises: e),
                        ),
                      );
                    },
                    child: Hero(
                      tag: e.id!,
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: CachedNetworkImage(
                                imageUrl: e.thumbnail!,
                                placeholder: (context, url) => Image(
                                  image: const AssetImage(
                                      "assets/placeholder.png"),
                                  fit: BoxFit.cover,
                                  height: 250,
                                  width: MediaQuery.of(context).size.width,
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(
                                  Icons.error,
                                ),
                                fit: BoxFit.cover,
                                height: 250,
                                width: MediaQuery.of(context).size.width,
                              ),
                              /* FadeInImage(
                                placeholder:
                                    const AssetImage("assets/placeholder.png"),
                                image: NetworkImage(e.thumbnail!),
                                height: 250,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover,
                              ), */
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 250,
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        Color(0xFF000000),
                                        Color(0x00000000),
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.center),
                                ),
                              ),
                            ),
                            Container(
                              height: 250,
                              padding:
                                  const EdgeInsets.only(left: 10, bottom: 10),
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                e.title!,
                                style: const TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              )
            : const LinearProgressIndicator(),
      ),
    );
  }
}
