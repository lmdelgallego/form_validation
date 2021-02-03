import 'package:flutter/material.dart';

bool isNumber(String value) {
  if (value.isEmpty) return false;
  final n = num.tryParse(value);
  return (n == null) ? false : true;
}

void mostrarAlerta(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: [
          FlatButton(
            child: Text('ok'),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      );
    },
  );
}
