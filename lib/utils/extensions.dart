import 'package:flutter/material.dart';

class Extensions {
  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Not implemented yet'),
      ),
    );
  }
}
