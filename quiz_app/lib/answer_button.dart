import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget{
  // AnswerButton(this.answerText, this.onTap, {super.key}); //positional argument
  const AnswerButton({
    super.key, 
    required this.answerText, 
    required this.onTap
  }); //named argument

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap, 
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        backgroundColor: const Color.fromARGB(255, 33, 1, 95),
        foregroundColor: Colors.white, //text colour
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        )
      ),
      child: Text(answerText, textAlign: TextAlign.center,),
    );
  }
}