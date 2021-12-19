import 'package:flutter/material.dart';

class ActionButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const ActionButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  _ActionButtonState createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      child: Text(
        widget.text,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          height: 30 / 20,
          color: Colors.white,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          Theme.of(context).primaryColor,
        ),
        fixedSize: MaterialStateProperty.all<Size>(
          Size.fromWidth(MediaQuery.of(context).size.width),
        ),
      ),
    );
  }
}
