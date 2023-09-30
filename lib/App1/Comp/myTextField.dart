import "package:flutter/material.dart";
class myTextField extends StatelessWidget {
  TextEditingController controller = TextEditingController();
   myTextField({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20,right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12)
      ),
      child: TextField(
        controller: controller,
        autofocus: true,
        decoration: InputDecoration(
          
          hintText: "Enter the task",
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder()
        ),
      ),
    );
  }
}