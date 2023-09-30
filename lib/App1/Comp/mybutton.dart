import 'package:flutter/material.dart';

class myButton extends StatelessWidget {
  final String name;
  final Color color;

  const myButton({super.key, required this.name, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 55,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(left: 12, right: 12),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(14)),
      child: Center(
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 20),
        ),
      ),
    );
  }
}
