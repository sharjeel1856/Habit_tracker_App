import 'package:flutter/material.dart';

class MYFloatingActionButton extends StatefulWidget {
  //making function of on_pressed
  final Function()? onPressed;
  const MYFloatingActionButton({Key? key, required this.onPressed})
      : super(key: key);

  @override
  State<MYFloatingActionButton> createState() => _MYFloatingActionButtonState();
}

class _MYFloatingActionButtonState extends State<MYFloatingActionButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: widget.onPressed,
      child: Icon(Icons.add),
    );
  }
}
