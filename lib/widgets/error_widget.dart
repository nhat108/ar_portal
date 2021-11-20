import 'package:flutter/material.dart';

class ErrorStateWidget extends StatelessWidget {
  final String error;

  const ErrorStateWidget({Key? key, required this.error}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(error),
    );
  }
}
