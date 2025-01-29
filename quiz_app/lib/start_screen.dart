import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; //connect to flutter package

//var keeps it optional, final makes it required, const makes it immutable
const startAlignment = Alignment.topLeft; //Alignment? is a nullable type
const endAlignment = Alignment.bottomRight;

class StartScreen extends StatelessWidget {//StatelessWidget is a class
  const StartScreen(this.startQuiz, {super.key}); //positional argument
  //const GradientContainer({super.key}, required this.colors); 
  // initialise the class
  // super.key is a constructor
    final void Function()startQuiz;

  @override //Override is a annotation
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(125, 255, 255, 255),
            ),
          const SizedBox(height: 80),
          Text(
              'Learn Flutter the fun way!', 
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
              ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start quiz')
          ),
        ],
      ),
    );
  }
}
