import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shop_ease/french/frenchHomepage.dart';
import 'package:shop_ease/french/frenchquizzes/quizzesFrench.dart';

class PageQuizChimie extends StatefulWidget {
  @override
  _PageQuizChimieState createState() => _PageQuizChimieState();
}

class _PageQuizChimieState extends State<PageQuizChimie> {
  final List<Map<String, String>> quizData = [
    {
      'question': 'Quel est le symbole chimique de l\'eau?',
      'answer': 'H2O',
    },
    {
      'question': 'Quel est le numéro atomique de l\'oxygène?',
      'answer': '8',
    },
    {
      'question': 'Quelle est la formule de l\'acide sulfurique?',
      'answer': 'H2SO4',
    },
    {
      'question': 'Quel est le symbole chimique du sodium?',
      'answer': 'Na',
    },
    {
      'question': 'Quel est le gaz le plus abondant dans l\'atmosphère terrestre?',
      'answer': 'Azote',
    },
    {
      'question': 'À quoi sert l\'échelle de pH?',
      'answer': 'Mesurer l\'acidité ou l\'alcalinité d\'une substance',
    },
    {
      'question': 'Quel est le symbole chimique de l\'or?',
      'answer': 'Au',
    },
    {
      'question': 'Quelle est la formule chimique du sel de table?',
      'answer': 'NaCl',
    },
    {
      'question': 'Comment appelle-t-on le processus de division des atomes?',
      'answer': 'Fission nucléaire',
    },
    {
      'question': 'Quel est le symbole chimique de l\'hélium?',
      'answer': 'He',
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
        title: Text('Questionnaire de Chimie'),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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

void main() {
  runApp(MaterialApp(
    home: PageQuizChimie(),
  ));
}
