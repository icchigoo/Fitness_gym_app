import 'package:fitness_gym_app/features/calculator/models/calculator_model.dart';
import 'package:fitness_gym_app/features/calculator/widgets/calculator.dart';
import 'package:fitness_gym_app/shared/utils/constants.dart';
import 'package:flutter/material.dart';

class CalculatorsScreen extends StatelessWidget {
  const CalculatorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calculators',
          style: kTextStyleHeaders,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 500,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Tile(index: index, context: context);
                },
                itemCount: CalTile.getCalData.length,
                physics: const NeverScrollableScrollPhysics(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Tile extends StatelessWidget {
  const Tile({Key? key, required this.index, required this.context})
      : super(key: key);
  final int index;
  final BuildContext context;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        leading: Text(
          CalTile.getCalData[index].leading,
          style: kTextStyleHeaders.copyWith(color: blueColor),
        ),
        title: Text(
          CalTile.getCalData[index].title,
          style: kTextStyleLarge.copyWith(color: Colors.black, fontSize: 20),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      Calculator(name: CalTile.getCalData[index].leading)));
        },
      ),
    );
  }
}
