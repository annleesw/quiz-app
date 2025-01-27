import 'package:flutter/material.dart'; //connect to flutter package

class QuestionsScreen extends StatefulWidget { //StatelessWidget always have 2 classes
  const QuestionsScreen({super.key}); //positional argument

  @override //Override is a annotation
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}
class _QuestionsScreenState extends State<QuestionsScreen> { //constructor function
  @override //Override is a annotation
  Widget build(context) {
    return const Text('Question Screen');
  }
}