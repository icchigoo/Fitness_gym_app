import 'package:fitness_gym_app/features/toDoList/widgets/add_task_dialog.dart';
import 'package:fitness_gym_app/features/toDoList/widgets/task_list.dart';
import 'package:fitness_gym_app/shared/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/toDoList_model.dart';

class ToDoListScreen extends StatelessWidget {
  const ToDoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: blueColor,
          onPressed: () => showDialog(
            context: context,
            builder: (context) => const AlertDialog(
              content: AddTaskDialog(),
            ),
          ),
          child: const Icon(Icons.add),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 50, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 35,
                      backgroundColor: blueColor,
                      child:
                          Icon(Icons.fact_check, size: 35, color: Colors.white),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'ToDoList',
                      style: kTextStyleHeaders,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${Provider.of<TaskData>(context, listen: true).tasksLength} Tasks',
                      style:
                          kTextStyleLarge.copyWith(fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(60))),
                child: TaskList(),
              ),
            ),
          ],
        ));
  }
}
