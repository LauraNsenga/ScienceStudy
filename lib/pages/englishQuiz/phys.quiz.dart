// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api

import 'dart:math';

import 'package:flutter/material.dart';

class PhysicsQuizPage extends StatefulWidget {
  @override
  _PhysicsQuizPageState createState() => _PhysicsQuizPageState();
}

class _PhysicsQuizPageState extends State<PhysicsQuizPage> {
  final List<Map<String, String>> quizData = [
    {
      'question': 'What is the SI unit of force?',
      'answer': 'Newton',
    },
    {
      'question': 'What is the acceleration due to gravity on Earth?',
      'answer': '9.8 m/s²',
    },
    {
      'question': 'What is the unit of electrical resistance?',
      'answer': 'Ohm',
    },
    // Add more questions and answers here
    {
      'question': 'What does the Law of Inertia state?',
      'answer': 'An object at rest will remain at rest, and an object in motion will remain in motion unless acted upon by an external force',
    },
    {
      'question': 'What is the SI unit of electric current?',
      'answer': 'Ampere',
    },
    {
      'question': 'What is the formula for kinetic energy?',
      'answer': '1/2 * mass * velocity^2',
    },
   
    {
      'question': 'What is the SI unit of power?',
      'answer': 'Watt',
    },
    {
      'question': 'What is the principle of conservation of energy?',
      'answer': 'Energy cannot be created or destroyed, only transformed from one form to another',
    },
    {
      'question': 'What is the formula for gravitational force?',
      'answer': 'G * (m1 * m2) / r^2',
    },
   
  ];

  List<Map<String, String>> selectedQuestions = [];

  @override
  void initState() {
    super.initState();
    selectRandomQuestions();
  }

  void selectRandomQuestions() {
    final random = Random();
    final Set<int> selectedIndexes = {};

    while (selectedIndexes.length < 10) {
      final index = random.nextInt(quizData.length);
      selectedIndexes.add(index);
    }

    selectedQuestions = selectedIndexes
        .map((index) => quizData[index])
        .toList(growable: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Physics Quiz'),
        backgroundColor: Color.fromARGB(255, 127, 45, 214),
      ),
      backgroundColor: Color.fromARGB(255, 14, 200, 237),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: selectedQuestions.length,
          itemBuilder: (context, index) {
            final question = selectedQuestions[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Question ${index + 1}: ${question['question']}',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 8),
                // Replace this with your multiple-choice options widget
                Text(
                  'Answer: ${question['answer']}',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
              ],
            );
          },
        ),
      ),
    );
  }
}
