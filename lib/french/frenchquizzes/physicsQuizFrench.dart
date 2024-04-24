import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shop_ease/french/frenchquizzes/quizzesFrench.dart';

class PageQuizPhysique extends StatefulWidget {
  const PageQuizPhysique({Key? key}) : super(key: key);

  @override
  _PageQuizPhysiqueState createState() => _PageQuizPhysiqueState();
}

class _PageQuizPhysiqueState extends State<PageQuizPhysique> {
  final List<Map<String, String>> quizData = [
    {
      'question': 'Quelle est l\'unité SI de la force?',
      'answer': 'Newton',
    },
    {
      'question': 'Quelle est l\'accélération due à la gravité sur Terre?',
      'answer': '9.8 m/s²',
    },
    {
      'question': 'Quelle est l\'unité de résistance électrique?',
      'answer': 'Ohm',
    },
    // Add more questions and answers here
    {
      'question': 'Que dit la loi d\'inertie?',
      'answer': 'Un objet au repos restera au repos, et un objet en mouvement restera en mouvement à moins d\'être soumis à une force externe',
    },
    {
      'question': 'Quelle est l\'unité SI du courant électrique?',
      'answer': 'Ampere',
    },
    {
      'question': 'Quelle est la formule de l\'énergie cinétique?',
      'answer': '1/2 * masse * vitesse^2',
    },

    {
      'question': 'Quelle est l\'unité SI de la puissance?',
      'answer': 'Watt',
    },
    {
      'question': 'Quel est le principe de conservation de l\'énergie?',
      'answer': 'L\'énergie ne peut ni être créée ni détruite, seulement transformée d\'une forme à une autre',
    },
    {
      'question': 'Quelle est la formule de la force gravitationnelle?',
      'answer': 'G * (m1 * m2) / r^2',
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
        title: Text('Questionnaire de Physique'),
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
                    ? 'Félicitations ! Vous avez réussi le quiz avec un score de $score.'
                    : 'Oops ! Vous n\'avez pas réussi le quiz. Votre score est de $score.'),
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
    home: PageQuizzes(),
  ));
}