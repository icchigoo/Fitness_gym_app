import 'package:flutter/material.dart';

class Task {
  Task({this.tasks, this.onChecked = false});
  String? tasks;
  bool onChecked;
  void toggleDone() {
    onChecked = !onChecked;
  }
}

class TaskData extends ChangeNotifier {
  List<Task> tasks = [];
  String? profilePhoto;

  void setProfilePhoto(String value) {
    profilePhoto = value;
    notifyListeners();
  }

  void addTasks(String newTask) {
    final task = Task(tasks: newTask);
    tasks.add(task);
    notifyListeners();
  }

  int get tasksLength {
    return tasks.length;
  }

  void updateTasks(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTasks(Task task) {
    tasks.remove(task);
    notifyListeners();
  }
}
