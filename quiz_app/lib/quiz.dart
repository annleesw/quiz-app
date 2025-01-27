import 'package:flutter/material.dart'; //connect to flutter package
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart'; 

class Quiz extends StatefulWidget { //StatelessWidget always have 2 classes
  const Quiz({super.key}); //positional argument

  @override //Override is a annotation
  State<Quiz> createState() {
    return _QuizState();
  }
}
class _QuizState extends State<Quiz> { //constructor function
  Widget? activeScreen; //? tells Dart that var may be widget or null
 
  @override
  void initState() {
    super.initState(); //best practice is to come first bfr doing any addn work
    activeScreen = StartScreen(switchScreen); //initialise activeScreen
  }

  void switchScreen() {
    setState(() { //re-execute build method
      activeScreen = const QuestionsScreen();}
    );
  }

  @override //Override is a annotation
  Widget build(context) {
    return MaterialApp(
      // const optimise runtime performance & keep const, MaterialApp is a widget
      home: Scaffold(
        // Scaffold is a widget
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurpleAccent,
                Colors.deepPurple,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}