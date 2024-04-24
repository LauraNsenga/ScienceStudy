import 'package:flutter/material.dart';

class ChemistryFrenchPage extends StatelessWidget {
  final List<Map<String, String>> quizData = [
    {
      'question': 'Quel est le symbole chimique de l\'eau ?',
      'answer': 'H2O',
    },
    {
      'question': 'Quel est le numéro atomique de l\'oxygène ?',
      'answer': '8',
    },
    {
      'question': 'Quelle est la formule de l\'acide sulfurique ?',
      'answer': 'H2SO4',
    },
    {
      'question': 'Quel est le symbole chimique du sodium ?',
      'answer': 'Na',
    },
    {
      'question': 'Quel est le gaz le plus abondant dans l\'atmosphère terrestre ?',
      'answer': 'Azote',
    },
    // Ajouter plus de questions et réponses ici
    {
      'question': 'À quoi sert l\'échelle de pH ?',
      'answer': 'Mesurer l\'acidité ou l\'alcalinité d\'une substance',
    },
    {
      'question': 'Quel est le symbole chimique de l\'or ?',
      'answer': 'Au',
    },
    {
      'question': 'Quelle est la formule chimique du sel de table ?',
      'answer': 'NaCl',
    },
    {
      'question': 'Quel est le processus de division des atomes ?',
      'answer': 'Fission nucléaire',
    },
    {
      'question': 'Quel est le symbole chimique de l\'hélium ?',
      'answer': 'He',
    },
    {
      'question': 'Quel est le nom du processus par lequel les plantes fabriquent leur propre nourriture ?',
      'answer': 'Photosynthèse',
    },
    {
      'question': 'Quel est le symbole chimique du carbone ?',
      'answer': 'C',
    },
    {
      'question': 'Quel est le processus de combinaison des éléments pour former de nouvelles substances ?',
      'answer': 'Réaction chimique',
    },
    {
      'question': 'Quel est le nom de la substance qui accélère une réaction chimique sans être consommée ?',
      'answer': 'Catalyseur',
    },
    {
      'question': 'Quelle est la formule chimique du peroxyde d\'hydrogène ?',
      'answer': 'H2O2',
    },
    {
      'question': 'Quel est le nom de la force qui maintient les atomes ensemble dans une molécule ?',
      'answer': 'Lien chimique',
    },
    {
      'question': 'Quel est le symbole chimique du fer ?',
      'answer': 'Fe',
    },
    {
      'question': 'Quel est le processus de retrait d\'électrons d\'un atome ou d\'une molécule ?',
      'answer': 'Ionisation',
    },
    {
      'question': 'Quelle est la formule chimique du méthane ?',
      'answer': 'CH4',
    },
    {
      'question': 'Quel est le nom du processus par lequel un liquide se transforme en gaz à son point d\'ébullition ?',
      'answer': 'Vaporisation',
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chimie'),
        backgroundColor: Colors.green, // Définissez la couleur de la barre d'applications en vert
      ),
      backgroundColor: Colors.white, // Définissez la couleur de fond en blanc
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
                      'Question ${index + 1} : ${quizData[index]['question']}',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Réponse : ${quizData[index]['answer']}',
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
