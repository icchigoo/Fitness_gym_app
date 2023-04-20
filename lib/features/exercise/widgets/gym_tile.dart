import 'package:flutter/material.dart';

import '../../../shared/utils/constants.dart';
import '../models/muscles_model.dart';

class GymTile extends StatelessWidget {
  const GymTile({
    super.key,
    required this.onTap,
    required this.index,
  });
  final Function() onTap;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      shadowColor: Colors.transparent,
      elevation: 10,
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Ink(
          decoration: kContainerDecoration.copyWith(
            image: DecorationImage(
                image: AssetImage('images/ms$index.jpg'), fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(MusclesModel.getMusclesData[index].name,
                    style: kTextStyleHeaders.copyWith(
                        color: Colors.white, fontSize: 20))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
