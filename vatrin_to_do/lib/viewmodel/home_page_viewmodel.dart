import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:vatrin_to_do/model/task.dart';
import 'package:vatrin_to_do/services/services.dart';

class HomePageViewModel extends ChangeNotifier {
  late List<Task> _tasks;
  bool isEmpty = true;

  Future<void> fetchTasks() async {
    _tasks = await Services.instance.readAllTask();
    if (_tasks.isNotEmpty) {
      isEmpty = false;
    }
    notifyListeners();
  }

  List<Task> getTasks() => _tasks;
}
