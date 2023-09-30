import "package:flutter/material.dart";
import "package:pomodroapp/App1/Comp/mybutton.dart";

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}
//#100f5b

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      
      
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Plan Your Work",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,),
              ),
            )),
            Text(
              "And Stay Productive",
              style: TextStyle(fontSize: 20,),
            ),

            SizedBox(height: 30,),
            Image.asset("Assets/2920019.jpg"),
            SizedBox(height: 120,),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/main'),
              child: myButton(name: "Get Started", color: Colors.purple.shade900))
          ],
        ),
        
      ),
    );
  }
}
