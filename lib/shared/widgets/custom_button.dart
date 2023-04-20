import 'package:fitness_gym_app/shared/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);
  final Function() onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: orangeColor,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(20),
        child: Ink(
          height: 50,
          width: 300,
          child: Center(
            child: Text(
              text,
              style: kTextStyleSmall.copyWith(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
