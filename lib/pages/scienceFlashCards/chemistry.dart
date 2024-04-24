import 'package:flutter/material.dart';

class ChemistryPage extends StatelessWidget {
  final List<Map<String, String>> quizData = [
    {
      'question': 'What is the chemical symbol for water?',
      'answer': 'H2O',
    },
    {
      'question': 'What is the atomic number of oxygen?',
      'answer': '8',
    },
    {
      'question': 'What is the formula for sulfuric acid?',
      'answer': 'H2SO4',
    },
    {
      'question': 'What is the chemical symbol for sodium?',
      'answer': 'Na',
    },
    {
      'question': 'What is the most abundant gas in Earth\'s atmosphere?',
      'answer': 'Nitrogen',
    },
    // Add more questions and answers here
    {
      'question': 'What is the pH scale used to measure?',
      'answer': 'Acidity or alkalinity of a substance',
    },
    {
      'question': 'What is the chemical symbol for gold?',
      'answer': 'Au',
    },
    {
      'question': 'What is the chemical formula for table salt?',
      'answer': 'NaCl',
    },
    {
      'question': 'What is the process of splitting atoms called?',
      'answer': 'Nuclear fission',
    },
    {
      'question': 'What is the chemical symbol for helium?',
      'answer': 'He',
    },
    {
      'question': 'What is the name of the process by which plants make their own food?',
      'answer': 'Photosynthesis',
    },
    {
      'question': 'What is the chemical symbol for carbon?',
      'answer': 'C',
    },
    {
      'question': 'What is the process of combining elements to form new substances called?',
      'answer': 'Chemical reaction',
    },
    {
      'question': 'What is the name of the substance that speeds up a chemical reaction without being consumed?',
      'answer': 'Catalyst',
    },
    {
      'question': 'What is the chemical formula for hydrogen peroxide?',
      'answer': 'H2O2',
    },
    {
      'question': 'What is the name of the force that holds atoms together in a molecule?',
      'answer': 'Chemical bond',
    },
    {
      'question': 'What is the chemical symbol for iron?',
      'answer': 'Fe',
    },
    {
      'question': 'What is the process of removing electrons from an atom or molecule called?',
      'answer': 'Ionization',
    },
    {
      'question': 'What is the chemical formula for methane?',
      'answer': 'CH4',
    },
    {
      'question': 'What is the name of the process by which a liquid turns into a gas at its boiling point?',
      'answer': 'Vaporization',
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chemistry'),
        backgroundColor: Colors.green, // Set app bar color to green
      ),
      backgroundColor: Colors.white, // Set background color to white
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: quizData.length,
          itemBuilder: (context, index) {
            return Card(
              color: index % 2 == 0 ? Colors.lightGreen[100] : Colors.lightGreen[200],
              elevation: 4,
              margin: EdgeInsets.only(bottom: 16),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Question ${index + 1}: ${quizData[index]['question']}',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Answer: ${quizData[index]['answer']}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
