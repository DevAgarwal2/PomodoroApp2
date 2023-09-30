import 'package:flutter/material.dart';
import 'package:pomodroapp/App1/logic/timer_model.dart';
import "package:provider/provider.dart";

class PauseButton extends StatelessWidget {
  PauseButton({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimeLogic>(context);
    return GestureDetector(
      onTap: () {
        provider.isPlaying
            ? Provider.of<TimeLogic>(context, listen: false).pause()
            : Provider.of<TimeLogic>(context, listen: false).start();
      },
      child: Container(
        padding: EdgeInsets.all(10),
        
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Center(child: provider.isPlaying?Icon(Icons.pause,size: 35,):Icon(Icons.play_arrow_rounded,size: 35,))
      ),
    );
  }
}
