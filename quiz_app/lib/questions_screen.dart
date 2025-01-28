import 'package:flutter/material.dart'; //connect to flutter package
import 'package:quiz_app/answer_button.dart'; 
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget { //StatelessWidget always have 2 classes
  const QuestionsScreen({super.key}); //positional argument

  @override //Override is a annotation
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}
class _QuestionsScreenState extends State<QuestionsScreen> { //constructor function
  var currentQuestionIndex = 0;
  void answerQuestion() {
    // currentQuestionIndex += 1;
    // currentQuestionIndex = currentQuestionIndex + 1;
    setState(() { //execute build method again
      currentQuestionIndex++; //increments the value by 1 only
    });
  }

  @override //Override is a annotation
  Widget build(context) {
  final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity, //build as wide as possible
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //vertical alignment
          crossAxisAlignment: CrossAxisAlignment.stretch, //horizontal alignment
          children: [
            Text(
              currentQuestion.text, 
              style: GoogleFonts.lato(
                color: Color.fromARGB(255, 201, 153, 251),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((answer) { 
              //map() yields an iterable (~a list), 'list in a list'
              //...: spread operator used instead of hard coding each button
              return AnswerButton(answerText: answer, onTap: answerQuestion);
            })
          ],
        ),
      ),
    );
    // const Text('Question Screen');
  }
}