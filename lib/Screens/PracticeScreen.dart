import 'package:flutter/material.dart';
import 'dart:math';

class PracticeScreen extends StatefulWidget {
  final int tableNumber;

  PracticeScreen({required this.tableNumber});

  @override
  _PracticeScreenState createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  final TextEditingController _answerController = TextEditingController();
  int _correctAnswers = 0;
  int _wrongAnswers = 0;
  String _feedbackMessage = '';
  late int _randomMultiplier;
  late int _correctAnswer;

  @override
  void initState() {
    super.initState();
    _generateNewQuestion();
  }

  void _generateNewQuestion() {
    _randomMultiplier = Random().nextInt(10) + 1; // Random number between 1 and 10
    _correctAnswer = widget.tableNumber * _randomMultiplier;
    _answerController.clear();
    setState(() {
      _feedbackMessage = '';
    });
  }

  void _checkAnswer() {
    int? userAnswer = int.tryParse(_answerController.text);

    if (userAnswer == null) {
      setState(() {
        _feedbackMessage = 'Please enter a valid number.';
      });
      return;
    }

    if (userAnswer == _correctAnswer) {
      _correctAnswers++;
      _feedbackMessage = 'Correct!';
    } else {
      _wrongAnswers++;
      _feedbackMessage = 'Wrong! The correct answer is $_correctAnswer.';
    }

    _generateNewQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practice Multiplication Table ${widget.tableNumber}'),
        backgroundColor: Color.fromARGB(255, 181, 164, 237),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: 'CustomFont', 
          fontSize: 20, 
          fontWeight: FontWeight.bold,
          ),
        ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'What is ${widget.tableNumber} x $_randomMultiplier?',
              style: TextStyle(fontSize: 24),
            ),

            SizedBox(height: 30),

            Center(
              child: Container(
                width: 500,
                child: TextField(
                  controller: _answerController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter your answer',
                    labelStyle: TextStyle(
                      fontSize: 18,
                    ),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 181, 164, 237)), // Color del borde cuando está enfocado
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkAnswer,
              child: Text('Submit'),
            ),

            SizedBox(height: 20),
            Text(
              _feedbackMessage,
              style: TextStyle(fontSize: 18, color: Colors.red),
            ),

            SizedBox(height: 20),
            Text(
              'Correct Answers: $_correctAnswers',
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),

            Text(
              'Wrong Answers: $_wrongAnswers',
              style: TextStyle(fontSize: 18, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
