import 'package:flutter/material.dart';
import 'package:shop_ease/french/frenchStudy/chemistryFrench.dart';
import 'package:shop_ease/french/frenchquizzes/quizzesFrench.dart';
import '../pages/home_page.dart';
import '../pages/opening_page.dart';
import 'frenchStudy/frenchBio.dart';
import 'package:shop_ease/french/frenchStudy/physicsFrench.dart';


class FrenchHomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); // Étape 1 : Créez une GlobalKey

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Étape 1 : Assignez la clé au Scaffold
      appBar: AppBar(
        title: Text('Application d\'étude', textAlign: TextAlign.center),
        centerTitle: true,
        backgroundColor: Colors.green, // Définissez la couleur de la barre d'applications en vert
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Ouvrez le tiroir lorsque l'icône de menu est pressée
            _scaffoldKey.currentState!.openDrawer(); // Étape 2 : Utilisez la clé pour ouvrir le tiroir
          },
        ),
      ),
      backgroundColor: Colors.white, // Définissez la couleur de fond en blanc
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Étirez les boutons horizontalement
          children: [
            Text(
              'Bonjour, Cecilia',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.normal,
                color: Colors.green, // Définissez la couleur de la police en vert
              ),
            ),
            SizedBox(height: 8), // Ajoutez de l'espace entre le message de salutation et l'énoncé de sélection
            Text(
              'Sélectionnez le sujet que vous souhaitez étudier aujourd\'hui ci-dessous :',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16), // Ajoutez de l'espace entre le message et les boutons
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BiologyFrenchPage(),
                  ),
                );
              },
              child: Text(
                'Biologie',
                style: TextStyle(color: Colors.black), // Définissez la couleur de la police en noir
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.lightGreen[100]!), // Définissez la couleur de fond du bouton en vert clair
              ),
            ),
            SizedBox(height: 16), // Ajoutez de l'espace entre les boutons
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PhysicsPage(),
                  ),
                );
              },
              child: Text(
                'Physique',
                style: TextStyle(color: Colors.black), // Définissez la couleur de la police en noir
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.lightGreen[100]!), // Définissez la couleur de fond du bouton en vert clair
              ),
            ),
            SizedBox(height: 16), // Ajoutez de l'espace entre les boutons
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChemistryFrenchPage(),
                  ),
                );
              },
              child: Text(
                'Chimie',
                style: TextStyle(color: Colors.black), // Définissez la couleur de la police en noir
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.lightGreen[100]!), // Définissez la couleur de fond du bouton en vert clair
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PageQuizzes(),
                  ),
                );
              },
              child: Text(
                'Questionnaires',
                style: TextStyle(color: Colors.black), // Définissez la couleur de la police en noir
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.lightGreen[100]!), // Définissez la couleur de fond du bouton en vert clair
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              ListTile(
                title: Text('Déconnexion'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OpeningPage(),
                    ),
                  );
                },
              ),
            ],
          ),
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
          'Bienvenue sur l\'écran du sujet $subject !',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}
