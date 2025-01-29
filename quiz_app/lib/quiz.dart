import 'package:flutter/material.dart'; //connect to flutter package
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart'; 
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget { //Stateful Widget always have 2 classes
  const Quiz({super.key}); //positional argument

  @override //Override is a annotation
  State<Quiz> createState() {
    return _QuizState();
  }
}
class _QuizState extends State<Quiz> { //constructor function
  // Widget? activeScreen; //? tells Dart that var may be widget or null
  List<String> selectedAnswer = [];

  var activeScreen = 'start-screen';
  // @override
  // void initState() { 
  //   super.initState(); //best practice is to come first bfr doing any addn work
  //   activeScreen = StartScreen(switchScreen); //initialise activeScreen
  // }
  
  // three important (stateful) widget lifecycle methods
  // initState(): Executed by Flutter when the StatefulWidget's State object is initialized
  // build(): Executed by Flutter when the Widget is built for the first time AND after setState() was called
  // dispose(): Executed by Flutter right before the Widget will be deleted (e.g., because it was displayed conditionally)

  void switchScreen() { 
    setState(() { //re-execute build method
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer); //same as python

    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }
  @override //Override is a annotation
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);
    
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );  
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(chosenAnswers: selectedAnswer,);
    }
    
    // final screenWidget = activeScreen == 'start-screen'
    //   ? StartScreen(switchScreen)
    //   : QuestionsScreen();

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
          // child: activeScreen == 'start-screen' // == : boolean value, comparison operator, T/F 
          //   ? StartScreen(switchScreen) // if T
          //   : const QuestionsScreen(), // else F
          child: screenWidget,
        ),
      ),
    );
  }
}