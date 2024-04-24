import 'package:flutter/material.dart';

class BiologyPage extends StatelessWidget {
  final List<Map<String, String>> quizData = [
    {'question': 'What is the powerhouse of the cell?', 'answer': 'Mitochondria'},
    {'question': 'What is the process by which plants make their own food?', 'answer': 'Photosynthesis'},
    {'question': 'What is the largest organ in the human body?', 'answer': 'Skin'},
    {'question': 'What type of cells are red blood cells?', 'answer': 'Erythrocytes'},
    {'question': 'What is the study of fossils called?', 'answer': 'Paleontology'},
    {'question': 'Which gas is essential for respiration?', 'answer': 'Oxygen'},
    {'question': 'What is the process by which organisms produce offspring?', 'answer': 'Reproduction'},
    {'question': 'What is the main function of the circulatory system?', 'answer': 'Transportation of nutrients and oxygen'},
    {'question': 'What are the building blocks of proteins?', 'answer': 'Amino acids'},
    {'question': 'What is the function of the nucleus in a cell?', 'answer': 'Control center; contains DNA'},
    {'question': 'What is the process of converting food into energy?', 'answer': 'Cellular respiration'},
    {'question': 'What are the primary organs of the respiratory system?', 'answer': 'Lungs'},
    // Add more questions and answers here
    {'question': 'What is the name of the pigment responsible for photosynthesis?', 'answer': 'Chlorophyll'},
    {'question': 'Which organelle is responsible for protein synthesis?', 'answer': 'Ribosome'},
    {'question': 'What is the scientific name for the process of cell division?', 'answer': 'Mitosis'},
    {'question': 'What is the process by which plants lose water vapor through their leaves?', 'answer': 'Transpiration'},
    {'question': 'What are the tiny hair-like structures on the surface of some cells called?', 'answer': 'Cilia'},
    {'question': 'What is the process by which organisms break down glucose to release energy without using oxygen?', 'answer': 'Fermentation'},
    {'question': 'What is the fluid inside a cell that contains organelles called?', 'answer': 'Cytoplasm'},
    {'question': 'Which scientist is known as the father of genetics?', 'answer': 'Gregor Mendel'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biology'),
        backgroundColor: Colors.green, // Set app bar color to green
      ),
      backgroundColor: Colors.white, // Set background color to white
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: quizData.length,
          itemBuilder: (context, index) {
            // Determine the color of the question box
            Color boxColor = index % 2 == 0 ? Colors.lightGreen.shade300 : Colors.lightGreen.shade200;

            return Container(
              margin: EdgeInsets.only(bottom: 16.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: boxColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Question ${index + 1}:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '${quizData[index]['question']}',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Answer:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '${quizData[index]['answer']}',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
