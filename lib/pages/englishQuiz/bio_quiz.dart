import 'dart:math';
import 'package:flutter/material.dart';

class BiologyQuizPage extends StatefulWidget {
  @override
  _BiologyQuizPageState createState() => _BiologyQuizPageState();
}

class _BiologyQuizPageState extends State<BiologyQuizPage> {
  final List<Map<String, String>> quizData = [
    {
      'question': 'What is the powerhouse of the cell?',
      'answer': 'Mitochondria',
    },
    {
      'question': 'What is the process by which plants make their own food?',
      'answer': 'Photosynthesis',
    },
    {
      'question': 'What is the largest organ in the human body?',
      'answer': 'Skin',
    },
    {
      'question': 'What type of cells are red blood cells?',
      'answer': 'Erythrocytes',
    },
    {
      'question': 'What is the study of fossils called?',
      'answer': 'Paleontology',
    },
    {
      'question': 'Which gas is essential for respiration?',
      'answer': 'Oxygen',
    },
    // Add more questions and answers here
    {
      'question': 'What is the process by which organisms produce offspring?',
      'answer': 'Reproduction',
    },
    {
      'question': 'What is the main function of the circulatory system?',
      'answer': 'Transportation of nutrients and oxygen',
    },
    {
      'question': 'What are the building blocks of proteins?',
      'answer': 'Amino acids',
    },
    {
      'question': 'What is the function of the nucleus in a cell?',
      'answer': 'Control center; contains DNA',
    },
  ];

  List<Map<String, String>> selectedQuestions = [];
  Map<int, String?> _selectedAnswers = {};

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

    // Generate options for each question
    selectedQuestions.forEach((question) {
      final List<String> options = generateRandomOptions(question['answer']!);
      question['options'] = options.join(',');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biology Quiz'),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: selectedQuestions.length,
          itemBuilder: (context, index) {
            final question = selectedQuestions[index];
            final List<String> options = question['options']!.split(',');
            final isAnswerSelected = _selectedAnswers.containsKey(index);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: index % 2 == 0
                      ? Colors.lightGreen[100]
                      : Colors.lightGreen[200],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Question ${index + 1}: ${question['question']}',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Column(
                  children: options.map((option) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: RadioListTile(
                        title: Text(option),
                        groupValue: _selectedAnswers[index],
                        value: option,
                        onChanged: isAnswerSelected
                            ? null
                            : (value) {
                          setState(() {
                            _selectedAnswers[index] = value as String?;
                          });
                        },
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 8),
                if (isAnswerSelected)
                  _selectedAnswers[index] == question['answer']
                      ? Icon(Icons.check, color: Colors.green)
                      : Icon(Icons.close, color: Colors.red),
                SizedBox(height: 16),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final score = calculateScore();
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Quiz Result'),
                content: Text(score >= 7
                    ? 'Congratulations! You passed the quiz with a score of $score.'
                    : 'Oops! You did not pass the quiz. Your score is $score.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.check),
      ),
    );
  }

  List<String> generateRandomOptions(String correctAnswer) {
    final List<String> allOptions = [];
    allOptions.add(correctAnswer);

    final remainingOptions = quizData
        .map((e) => e['answer']!)
        .where((element) => element != correctAnswer)
        .toList();

    final random = Random();
    while (allOptions.length < 4) {
      final randomIndex = random.nextInt(remainingOptions.length);
      final option = remainingOptions[randomIndex];
      allOptions.add(option);
      remainingOptions.removeAt(randomIndex);
    }

    allOptions.shuffle();
    return allOptions;
  }

  int calculateScore() {
    int score = 0;
    for (int i = 0; i < selectedQuestions.length; i++) {
      final question = selectedQuestions[i];
      final correctAnswer = question['answer'];
      final selectedAnswer = _selectedAnswers[i];
      if (selectedAnswer == correctAnswer) {
        score++;
      }
    }
    return score;
  }
}
