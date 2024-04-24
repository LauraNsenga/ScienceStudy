import 'package:flutter/material.dart';
import 'package:shop_ease/spanish/spanishQuizzes/bioQuizSpanish.dart';
import 'package:shop_ease/spanish/spanishQuizzes/chemQuizSpanish.dart';
import 'package:shop_ease/spanish/spanishQuizzes/physicsQuizSpanish.dart';
import 'package:shop_ease/spanish/spanish_homepage.dart';
import '../pages/englishQuiz/bio_quiz.dart';
import '../pages/englishQuiz/chem_quiz.dart';
import '../pages/englishQuiz/phys.quiz.dart';


class QuizzesPageSpanish extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cuestionarios', textAlign: TextAlign.center),
        centerTitle: true,
        backgroundColor: Colors.green, // Set app bar color to green
      ),
      backgroundColor: Colors.white, // Set background color to white
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Align content to the start of the column
          crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch the content horizontally
          children: [
            Text(
              'Seleccionar cuestionario',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16), // Add space between title and buttons
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaginaCuestionarioBiologia(),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.lightGreen), // Set button color to light green
              ),
              child: Text(
                ' Biología Cuestionario',
                style: TextStyle(color: Colors.black), // Set button text color to black
              ),
            ),
            SizedBox(height: 8), // Add space between buttons
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaginaQuizFisica(),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.lightGreen), // Set button color to light green
              ),
              child: Text(
                ' Física Cuestionario',
                style: TextStyle(color: Colors.black), // Set button text color to black
              ),
            ),
            SizedBox(height: 8), // Add space between buttons
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaginaQuizQuimica(),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.lightGreen), // Set button color to light green
              ),
              child: Text(
                'Química Cuestionario',
                style: TextStyle(color: Colors.black), // Set button text color to black
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SubjectScreen extends StatelessWidget {
  final String subject;

  SubjectScreen({required this.subject});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subject),
      ),
      body: Center(
        child: Text(
          'Welcome to the $subject subject screen!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SpanishHomePage(),
  ));
}

