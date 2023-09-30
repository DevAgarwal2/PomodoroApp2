import "package:flutter/material.dart";

class RelaxTime extends StatelessWidget {
  String name;
  Color? backgroundColor;
  Color textColor;
  RelaxTime(
      {super.key,
      required this.name,
      required this.textColor,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: backgroundColor,
          border: Border.all(color: Colors.white)),
      child: Text(
        name,
        style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 16),
      ),
    );
  }
}
