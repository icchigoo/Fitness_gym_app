import 'package:fitness_gym_app/shared/utils/constants.dart';
import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile(
      {super.key,
      this.onChecked = false,
      this.task,
      this.checkBoxCallBack,
      this.longPressCallBack});
  final String? task;
  final bool onChecked;
  final Function(bool?)? checkBoxCallBack;
  final Function()? longPressCallBack;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallBack!,
      leading: Text(
        task.toString(),
        style: kTextStyleLarge.copyWith(
            color: Colors.black,
            decoration: onChecked == true ? TextDecoration.lineThrough : null,
            decorationThickness: 3),
      ),
      trailing: Checkbox(
        checkColor: orangeColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        activeColor: const Color(0xff181920),
        value: onChecked,
        onChanged: checkBoxCallBack!,
      ),
    );
  }
}
