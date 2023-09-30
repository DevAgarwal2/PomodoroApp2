


import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pomodroapp/App1/Screen/main_screen.dart';
import 'package:pomodroapp/App1/Screen/screen1.dart';
import 'package:pomodroapp/App1/logic/calender_model.dart';
import 'package:pomodroapp/App1/logic/timer_model.dart';
import 'package:pomodroapp/App1/splash.dart';
import 'package:pomodroapp/firebase_options.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    
       MultiProvider(providers: [
        ChangeNotifierProvider(create: (context)=>TimeLogic()),
        ChangeNotifierProvider(create: (context)=>CalenderLogic())
      ],
      child: MyApp(),
       )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        '/page1': (context) => Screen1(),
        '/main': (context) => MainScreen(),
      },
    );
  }
}
