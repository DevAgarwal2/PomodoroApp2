
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pomodroapp/App1/Comp/music_type.dart';
import 'package:pomodroapp/App1/Comp/pause_button.dart';
import 'package:pomodroapp/App1/Comp/relax_timer.dart';
import 'package:pomodroapp/App1/logic/timer_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   bool isPomodoroSelected = true;
    bool isShortBreakSelected = false;
    bool isLongBreakSelected = false;
  String currentName = "Pomodoro";
  String showName() {
    return currentName;
  }

  String musicbackground = "image5.jpg";

  List imageList = ["image1.jpg", "image2.jpg", "image3.jpg", "image4.jpg"];
  @override
  Widget build(BuildContext context) {
   

    final provider = Provider.of<TimeLogic>(context);
    final second = TimeLogic.currentDuration ~/ 60;
    var second2 = (TimeLogic.currentDuration % 60).round();

    double completePercentage =
        1 - (TimeLogic.currentDuration / TimeLogic.selectTime);
    

    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("Assets/$musicbackground"),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                      hoverColor: Colors.white,
                      onTap: () {
                        print(second);
                        provider.pause();
                        setState(() {
                          isPomodoroSelected=true;
                          isLongBreakSelected=false;
                          isShortBreakSelected=false;
                          currentName = "Pomodoro";
                        });

                        provider.setDuration(1500, 1500);
                      },
                      child: RelaxTime(
                        name: "Pomodoro",
                        textColor: isPomodoroSelected? Colors.black:Colors.white,
                        backgroundColor: isPomodoroSelected?Colors.white:Colors.transparent,
                      )),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                      hoverColor: Colors.white,
                      onTap: () {
                        print(second);
                        provider.pause();
                        setState(() {
                          isPomodoroSelected=false;
                          isLongBreakSelected=false;
                          isShortBreakSelected=true;
                          currentName = "Short Break";
                        });

                        provider.setDuration(300, 300);
                      },
                      child: RelaxTime(
                        name: "Short Break",
                        textColor: isShortBreakSelected?Colors.black:Colors.white,
                        backgroundColor: isShortBreakSelected?Colors.white:Colors.transparent,
                      )),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                      hoverColor: Colors.white,
                      onTap: () {
                        provider.pause();
                        provider.setDuration(900, 900);
                        setState(() {
                          currentName = "Long Break";
                          isPomodoroSelected=false;
                          isLongBreakSelected=true;
                          isShortBreakSelected=false;
                        });
                      },
                      child: RelaxTime(
                        name: "Long Break",
                        textColor: isLongBreakSelected?Colors.black:Colors.white,
                        backgroundColor: isLongBreakSelected?Colors.white:Colors.transparent,
                      )),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              currentName,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            SizedBox(
              height: 60,
            ),
            CircularPercentIndicator(
              radius: 100,
              center: Text(
                "${(second).toString()}: ${second2.toString().length == 1 ? "0" + second2.toString() : second2}",
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              lineWidth: 8,
              percent: completePercentage,
              progressColor: Colors.blue.shade800,
              backgroundColor: Colors.white,
            ),
            SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      Provider.of<TimeLogic>(context, listen: false).restart();
                    },
                    icon: Icon(
                      Icons.replay_outlined,
                      color: Colors.white,
                      size: 35,
                    )),
                PauseButton(),
                MusicType(
                  onMusic: (p0) {
                    setState(() {
                      musicbackground = p0;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      )),
    );
  }
}
