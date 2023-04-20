import 'package:flutter/material.dart';
import '../../../shared/utils/constants.dart';
import '../models/difficulty_model.dart';
import '../widgets/difficulty_tile.dart';
import 'list_screen.dart';

class DifficultyScreen extends StatelessWidget {
  const DifficultyScreen({Key? key, required this.muscle}) : super(key: key);
  final String muscle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          muscle.toString(),
          style: kTextStyleHeaders,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: DifficultyTile(
                  index: index,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListScreen(
                          level: DifficultyModel.getDifficultyData[index].level,
                          muscle: muscle),
                    ),
                  ),
                ),
              );
            },
            itemCount: 3,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
          ),
        ),
      ),
    );
  }
}
