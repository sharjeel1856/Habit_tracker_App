import 'package:flutter/material.dart';

class MYAlertBox extends StatefulWidget {
  final TextEditingController controller;
  //We made a controller to access what is written in text feild
  final VoidCallback onSave;
  final VoidCallback onCancel;
  //These are the two functions that are used for te functionality
  // of Save and Cancel button on the dialog box.
  final String hintText;
  //This function is used to show hint on dialogbox of in the Text Feild
  const MYAlertBox(
      {Key? key,
      required this.controller,
      required this.onSave,
      required this.onCancel,
      required this.hintText})
      : super(key: key);

  @override
  State<MYAlertBox> createState() => _EnterNewHabitBoxState();
}

class _EnterNewHabitBoxState extends State<MYAlertBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[900],
      content: TextField(
        controller: widget.controller,
        style: const TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
        decoration: InputDecoration(
          hintText: widget.hintText, // Fix here
          hintStyle: TextStyle(color: Colors.grey),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        ),
      ),
      actions: [
        MaterialButton(
          onPressed: widget.onSave,
          child: Text(
            "Save",
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.black,
        ),
        MaterialButton(
          onPressed: widget.onCancel,
          child: Text(
            "Cancel",
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.black,
        ),
      ],
    );
  }
}
