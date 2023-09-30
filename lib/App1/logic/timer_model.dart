import 'dart:async';

import 'package:flutter/material.dart';

class TimeLogic extends ChangeNotifier{
  Timer? timer;
   static double currentDuration =1500;
   static double selectTime=1500;
  bool isPlaying = false;
 
  

  
  void start(){
  
    isPlaying = true;
    timer = Timer.periodic(Duration(seconds: 1), (timer) { 

    if(currentDuration <=0){
      pause();
      Text("0:00");
    }
    else{
          currentDuration--;
      notifyListeners();
    }
      

    });
    
    notifyListeners();
  }
  void restart(){
    
    currentDuration = selectTime;
    pause();
    
    
    
  }
  void pause(){
   if (timer != null) {
    timer!.cancel();
    isPlaying = false;
  }
    notifyListeners();
  }

  void setDuration(double currentDuration2,double selectTime2){
    currentDuration = currentDuration2;
    selectTime = selectTime2;
  }
  
}