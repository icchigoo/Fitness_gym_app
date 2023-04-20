import 'dart:convert';

import 'package:fitness_gym_app/features/exercise/models/difficulty_model.dart';
import 'package:fitness_gym_app/features/exercise/screens/workout_screen.dart';
import 'package:fitness_gym_app/shared/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../models/gym_model.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key, required this.muscle, required this.level});
  final String muscle;
  final String level;

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List decodeData = [];
  Future getWorkout() async {
    var url =
        "https://exercises-by-api-ninjas.p.rapidapi.com/v1/exercises?${'muscle'}=${GymModel.muscles}&difficulty=${GymModel.difficulty}";
    final headers = {
      'X-RapidAPI-Key': "8963005d09msh043f84b9a7c9cd8p1761dejsn83d9562938be",
      'X-RapidAPI-Host': "exercises-by-api-ninjas.p.rapidapi.com",
    };
    Response response = await get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      setState(() => decodeData = json.decode(response.body));
    } else {
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    GymModel.beginner(widget.muscle, widget.level);
    GymModel.intermediate(widget.muscle, widget.level);
    getWorkout();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Exercises',
          style: kTextStyleHeaders,
        ),
      ),
      body: decodeData.isEmpty
          ? const Center(
              child: CircularProgressIndicator(
                color: blueColor,
              ),
            )
          : widget.level == DifficultyModel.getDifficultyData[2].level
              ? const Center(
                  child: Text('No Data', style: kTextStyleHeadings),
                )
              : Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(top: 5, left: 5, right: 5),
                        child: Card(
                          elevation: 3,
                          shadowColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: ListTile(
                            leading: const Image(
                              image: AssetImage('images/mainIcon.png'),
                              height: 40,
                              width: 40,
                            ),
                            title: Text(decodeData[index]['name'],
                                style: kTextStyleLarge.copyWith(
                                    color: Colors.black)),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => WorkoutScreen(
                                      muscle: widget.muscle,
                                      level: widget.level,
                                      name: decodeData[index]['name'],
                                    ),
                                  ));
                            },
                          ),
                        ),
                      );
                    },
                    itemCount: decodeData.length,
                  ),
                ),
    );
  }
}
