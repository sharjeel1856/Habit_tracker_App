import 'package:flutter/material.dart';
import 'package:habit_tracking/componets/floating_btn.dart';

import '../componets/habit_tile.dart';
import '../componets/my_alert_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //data strcturs for todays list
  //[habitName , HabitCompleted ]
  List todaysHabitList = [
    ["Morning Run", false],
    ["Read Book", false],
  ];
  //bool to control habit completed
  bool habitCompleted = false;
  //checkbox was tapped
  void checkBoxTapped(bool? value, int index) {
    setState(() {
      todaysHabitList[index][1] = value;
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
          onSave: saveNewHabit,
          onCancel: cancelNewHabit,
        );
      },
    );
  }

  //Save new habit function
  void saveNewHabit() {
    //add new habit to todays habit list
    setState(() {
      todaysHabitList.add([_newHabitNameController.text, false]);
    });

    //to clear the text-feild
    _newHabitNameController.clear();
    //pop dialog box
    Navigator.of(context).pop();
  }

  //cancel new habit
  void cancelNewHabit() {
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
          //onSave: () => saveExistingHabit(index),
          //onCancel: cancelDialogBox,
        );
      },
    );
  }
  //save

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      //Calling of floating_action_button on the home_screen
      floatingActionButton: MYFloatingActionButton(
        onPressed: () => createNewHabit(),
      ),
      body: ListView.builder(
          itemCount: todaysHabitList.length,
          itemBuilder: (context, index) {
            return HabitTile(
              habitName: todaysHabitList[index][0],
              habitCompleted: todaysHabitList[index][1],
              onChanged: (value) => checkBoxTapped(value, index),
              settingsTapped: (context) => openHabitSettings(index),
            );
          }),
    );
  }
}
