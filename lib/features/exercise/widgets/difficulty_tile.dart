import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../shared/utils/constants.dart';
import '../models/difficulty_model.dart';

class DifficultyTile extends StatelessWidget {
  const DifficultyTile({Key? key, required this.onTap, required this.index})
      : super(key: key);
  final Function() onTap;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: Colors.transparent,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Ink(
          width: 300,
          height: 200,
          decoration: kContainerDecoration.copyWith(
              image: DecorationImage(
                  image: AssetImage('images/d$index.jpg'), fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RatingBar.builder(
                  itemCount: 5,
                  allowHalfRating: true,
                  itemSize: 30,
                  ignoreGestures: true,
                  unratedColor: Colors.white,
                  initialRating:
                      DifficultyModel.getDifficultyData[index].rating,
                  itemBuilder: (context, index) {
                    return const Icon(
                      Icons.star,
                      color: Color(0xFFE21414),
                    );
                  },
                  onRatingUpdate: (value) {},
                ),
                Text(DifficultyModel.getDifficultyData[index].level,
                    style: kTextStyleHeaders.copyWith(
                        color: Colors.white, fontSize: 20)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
