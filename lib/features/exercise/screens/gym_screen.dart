import 'package:fitness_gym_app/features/exercise/models/muscles_model.dart';
import 'package:fitness_gym_app/features/exercise/screens/difficulty_screen.dart';
import 'package:fitness_gym_app/shared/utils/constants.dart';
import 'package:flutter/material.dart';
import '../widgets/gym_tile.dart';

class GymScreen extends StatelessWidget {
  const GymScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Gym',
            style: kTextStyleHeaders,
          ),
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(left: 35, right: 35, bottom: 20, top: 28),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return GymTile(
                index: index,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DifficultyScreen(
                        muscle: MusclesModel.getMusclesData[index].name),
                  ),
                ),
              );
            },
            scrollDirection: Axis.vertical,
            itemCount: MusclesModel.getMusclesData.length,
            physics: const NeverScrollableScrollPhysics(),
          ),
        ));
  }
}
