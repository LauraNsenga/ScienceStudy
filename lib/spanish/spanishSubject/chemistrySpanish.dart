import 'package:flutter/material.dart';
import 'package:shop_ease/spanish/spanish_homepage.dart';

class ChemistryPageSpanish extends StatelessWidget {
  final List<Map<String, String>> quizData = [
    {
      'question': '¿Cuál es el símbolo químico del agua?',
      'answer': 'H2O',
    },
    {
      'question': '¿Cuál es el número atómico del oxígeno?',
      'answer': '8',
    },
    // Add more translated questions and answers here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Química'),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: quizData.length,
          itemBuilder: (context, index) {
            // Determine the color of the question box
            Color? boxColor = index % 2 == 0 ? Colors.lightGreen[100] : Colors.lightGreen[200];

            return Container(
              margin: EdgeInsets.only(bottom: 16.0),
              padding: EdgeInsets.all(16.0),
              color: boxColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pregunta ${index + 1}: ${quizData[index]['question']}',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Respuesta: ${quizData[index]['answer']}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            );
          },
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
