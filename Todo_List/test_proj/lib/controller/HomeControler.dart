import 'dart:ui';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  List myTasks = [];
  List myTasksStat= [];


  void addTask( dynamic task) {
    myTasks.add(task);

    notifyListeners();
  }
  void removeTask(int index) {
    myTasks.removeAt(index);
    myTasksStat.removeAt(index);
    notifyListeners();
  }

  void printTask() {
    print(myTasks);
  }

}
