import 'package:flutter/material.dart';

class AddNewPlacePage extends StatefulWidget {
  @override
  _AddNewPlacePageState createState() => _AddNewPlacePageState();
}

class _AddNewPlacePageState extends State<AddNewPlacePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // CustomTextField(
          //   enabled: true,
          //   controller: _emailController,
          //   onValid: (valid) {},
          //   hintText: 'Enter Email',
          //   validType: ValidType.email,
          // ),
        ],
      ),
    );
  }
}
