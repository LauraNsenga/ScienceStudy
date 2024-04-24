import 'package:flutter/material.dart';
import 'package:shop_ease/french/frenchquizzes/physicsQuizFrench.dart';
import 'package:shop_ease/pages/home_page.dart';
import 'package:shop_ease/pages/scienceFlashCards/chemistry.dart';
import 'bioQuizFrench.dart';
import 'chemQuizFrench.dart';



class PageQuizzes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Questionnaires', textAlign: TextAlign.center),
        centerTitle: true,
        backgroundColor: Colors.green, // Définissez la couleur de la barre d'applications en vert
      ),
      backgroundColor: Colors.white, // Définissez la couleur de fond en blanc
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Aligner le contenu sur le début de la colonne
          crossAxisAlignment: CrossAxisAlignment.stretch, // Étirer le contenu horizontalement
          children: [
            Text(
              'Sélectionnez le questionnaire que vous souhaitez faire',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16), // Ajouter de l'espace entre le titre et les boutons
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PageQuizBiologie(),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.lightGreen), // Définir la couleur du bouton en vert clair
              ),
              child: Text(
                'Questionnaire de Biologie',
                style: TextStyle(color: Colors.black), // Définir la couleur du texte du bouton en noir
              ),
            ),
            SizedBox(height: 8), // Ajouter de l'espace entre les boutons
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PageQuizPhysique(),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.lightGreen), // Définir la couleur du bouton en vert clair
              ),
              child: Text(
                'Questionnaire de Physique',
                style: TextStyle(color: Colors.black), // Définir la couleur du texte du bouton en noir
              ),
            ),
            SizedBox(height: 8), // Ajouter de l'espace entre les boutons
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PageQuizChimie(),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.lightGreen), // Définir la couleur du bouton en vert clair
              ),
              child: Text(
                'Questionnaire de Chimie',
                style: TextStyle(color: Colors.black), // Définir la couleur du texte du bouton en noir
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
          'Bienvenue dans l\'écran de sujet $subject !',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PageQuizzes(),
  ));
}

