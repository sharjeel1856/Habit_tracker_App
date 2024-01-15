import 'package:flutter/material.dart';
import 'package:habit_tracking/componets/floating_btn.dart';
import 'package:habit_tracking/data/habit_database.dart';
import 'package:hive/hive.dart';

import '../componets/habit_tile.dart';
import '../componets/my_alert_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Creating Instance of Habit DataBase
  HabitDatabase db = HabitDatabase();
  final _myBox = Hive.box("Habit_Database");

  @override
  void initState() {
    //if there is on current habit list, then it is 1st time ever opened app
    //then crate default data
    if (_myBox.get("CURRENT_HABIT_LIST") == null) {
      db.createDefaultData();
    }
    //their is already an data exists , their is no first time
    else {
      db.loadData();
    }
    //update the database
    db.updateDatabase();
    super.initState();
  }

  //checkbox was tapped
  void checkBoxTapped(bool? value, int index) {
    setState(() {
      db.todaysHabitList[index][1] = value;
    });
  }

  //create a new habit
  //assigning functionalites of dialogbox
  final _newHabitNameController = TextEditingController();
  void createNewHabit() {
    //This is for the adding the new habit by clicking the floating button and dialogbox will be opened their.
    showDialog(
      context: context,
      builder: (context) {
        return MYAlertBox(
          controller: _newHabitNameController,
          hintText: 'Enter Habit Name...',
          onSave: saveNewHabit,
          onCancel: cancelDialogBox,
        );
      },
    );
  }

  //Save new habit function
  void saveNewHabit() {
    //add new habit to todays habit list
    setState(() {
      db.todaysHabitList.add([_newHabitNameController.text, false]);
    });

    //to clear the text-feild
    _newHabitNameController.clear();
    //pop dialog box
    Navigator.of(context).pop();
  }

  //cancel new habit
  void cancelDialogBox() {
    //to clear the text-feild
    _newHabitNameController.clear();
    //pop dialog box
    Navigator.of(context).pop();
  }

  //open habit Settings to edit
  void openHabitSetings(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return MYAlertBox(
          controller: _newHabitNameController,
          hintText: db.todaysHabitList[index][0],
          onSave: () => saveExixitingHabit(index),
          onCancel: cancelDialogBox,
        );
      },
    );
  }

  //save existing habit with a new name
  void saveExixitingHabit(int index) {
    setState(() {
      db.todaysHabitList[index][0] = _newHabitNameController.text;
    });
    _newHabitNameController.clear();
    Navigator.pop(context);
  }

  // delete habit
  void deleteHabit(int index) {
    setState(() {
      db.todaysHabitList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      //Calling of floating_action_button on the home_screen
      floatingActionButton: MYFloatingActionButton(
        onPressed: () => createNewHabit(),
      ),
      body: ListView.builder(
          itemCount: db.todaysHabitList.length,
          itemBuilder: (context, index) {
            return HabitTile(
              habitName: db.todaysHabitList[index][0],
              habitCompleted: db.todaysHabitList[index][1],
              onChanged: (value) => checkBoxTapped(value, index),
              settingsTapped: (context) => openHabitSetings(index),
              deleteTapped: (context) => deleteHabit(index),
            );
          }),
    );
  }
}
