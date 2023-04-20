import 'package:fitness_gym_app/shared/utils/constants.dart';
import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  const GenderCard({
    super.key,
    required this.text,
    required this.icon,
    required this.inactiveColor,
    required this.onTap,
  });
  final String text;
  final Icon icon;
  final Color inactiveColor;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Ink(
          decoration: kContainerDecoration.copyWith(color: inactiveColor),
          width: 160,
          height: 90,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                icon,
                Text(
                  text,
                  style: kTextStyleLarge.copyWith(
                      color: Colors.white, fontSize: 22),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
