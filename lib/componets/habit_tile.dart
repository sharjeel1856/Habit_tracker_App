import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HabitTile extends StatefulWidget {
  // Habit name
  final String habitName;
  // To check whether the habit is complete or not
  final bool habitCompleted;
  // Function to tap on the checkbox
  final Function(bool?)? onChanged;
  //Function to tap the settings
  final Function(BuildContext)? settingsTapped;
  //Function t delete the habit
  final Function(BuildContext)? deleteTapped;

  const HabitTile(
      {Key? key, // Correcting the key parameter
      required this.habitName,
      required this.habitCompleted,
      required this.onChanged,
      required this.settingsTapped,
      required this.deleteTapped})
      : super(key: key); // Assigning the key parameter to super constructor

  @override
  State<HabitTile> createState() => _HabitTileState();
}

class _HabitTileState extends State<HabitTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      //Slidable Widget that is used to slider the list-item
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            //for setting option
            SlidableAction(
              onPressed: widget.settingsTapped,
              backgroundColor: Colors.grey.shade800,
              icon: Icons.settings,
              borderRadius: BorderRadius.circular(12),
            ),

            //for delete option
            SlidableAction(
              onPressed: widget.deleteTapped,
              backgroundColor: Colors.red.shade400,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              // Checkbox
              Checkbox(
                value: widget.habitCompleted,
                onChanged: widget.onChanged,
              ),
              // Habit name
              Text(widget.habitName),
            ],
          ),
        ),
      ),
    );
  }
}
