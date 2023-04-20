import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_gym_app/features/toDoList/models/toDoList_model.dart';
import 'package:fitness_gym_app/features/toDoList/widgets/add_task_dialog.dart';
import 'package:fitness_gym_app/features/toDoList/widgets/task_tile.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  TaskList({super.key});
  final firebaseFirestore = FirebaseFirestore.instance
      .collection('Tasks')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('Task');
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Consumer<TaskData>(
        builder: (context, taskData, child) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return TaskTile(
                onChecked: taskData.tasks[index].onChecked,
                task: taskData.tasks[index].tasks,
                checkBoxCallBack: (checkState) {
                  taskData.updateTasks(
                    taskData.tasks[index],
                  );
                  firebaseFirestore.doc(AddTaskDialog.taskId).set({
                    'taskName': taskData.tasks[index].tasks.toString(),
                    'isDone': taskData.tasks[index].onChecked,
                  });
                },
                longPressCallBack: () {
                  taskData.deleteTasks(taskData.tasks[index]);
                  firebaseFirestore.doc(AddTaskDialog.taskId).delete();
                },
              );
            },
            itemCount: taskData.tasksLength,
          );
        },
      ),
    );
  }
}
