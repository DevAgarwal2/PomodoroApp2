import 'package:flutter/material.dart';
import 'package:pomodroapp/App1/Pages/calender.dart';
import 'package:pomodroapp/App1/Pages/home.dart';
import 'package:pomodroapp/App1/Pages/setting.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectIndex = 0;
  List<Widget> pages = [HomePage(),CalenderPage(),SettingPage()];
  void changeIndec(int value){
    setState(() {
      selectIndex = value;
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        
        backgroundColor: Colors.black,
        currentIndex: selectIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        onTap: changeIndec,
        items: [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
      BottomNavigationBarItem(
        icon: Icon(Icons.calendar_month_rounded,), label: ''),
      
    ]),
        
    
    body: pages[selectIndex],
    
    );
  }
}
// //BottomNavigationBar(
//           currentIndex: selectIndex,
//           onTap: changeIndec,
//           items: [
//       BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
//       BottomNavigationBarItem(
//           icon: Icon(Icons.calendar_month_rounded), label: ''),
//       BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
      
//     ]),