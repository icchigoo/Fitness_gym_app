import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_gym_app/features/toDoList/models/toDoList_model.dart';
import 'package:fitness_gym_app/shared/utils/constants.dart';
import 'package:fitness_gym_app/shared/widgets/custom_button.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class AddTaskDialog extends StatefulWidget {
  const AddTaskDialog({super.key});
  static var taskId = const Uuid().v1();
  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  String? task;
  Task obj = Task();

  final firebaseFirestore = FirebaseFirestore.instance
      .collection('Tasks')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('Task');
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('New Task',
            style: kTextStyleHeaders.copyWith(color: Colors.black)),
        const SizedBox(height: 10),
        Text('What are you planning?',
            style: kTextStyleSmall.copyWith(color: Colors.black)),
        const SizedBox(height: 30),
        SizedBox(
          height: 30,
          child: TextField(
            textCapitalization: TextCapitalization.words,
            style: kTextStyleSmall.copyWith(color: Colors.black),
            onChanged: (value) {
              setState(() {
                task = value;
              });
            },
          ),
        ),
        const SizedBox(height: 30),
        CustomButton(
          text: 'Add',
          onPressed: () {
            Provider.of<TaskData>(context, listen: false).addTasks(
              task.toString(),
            );
            firebaseFirestore.doc(AddTaskDialog.taskId).set({
              'taskName': task.toString(),
              'isDone': obj.onChecked,
            });
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
