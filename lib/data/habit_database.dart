import 'package:hive_flutter/hive_flutter.dart';

//refrence of our box
final _mybox = Hive.box("Habit_Database");

class HabitDatabase {
  List todaysHabitList = [];

  //create initial default data
  void createDefaultData() {
    todaysHabitList = [
      ["Run", false],
      ["Read", false],
    ];
  }

// load data if already exixts
  void loadData() {}

// updateDatabase
  void updateDatabase() {}
}
