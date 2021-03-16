import 'package:flutter/material.dart';

class OptionRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){},
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Colors.white,
        ),
        child: Text(
          'گزینه ی اول',
          style: TextStyle(color: Colors.grey.shade800),
        ),
      ),
    );
  }
}
