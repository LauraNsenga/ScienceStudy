import 'package:flutter/material.dart';

class BiologyFrenchPage extends StatelessWidget {
  final List<Map<String, String>> quizData = [
    {'question': 'Quel est l\'organe de la cellule ?', 'answer': 'Mitochondrie'},
    {'question': 'Quel est le processus par lequel les plantes fabriquent leur propre nourriture ?', 'answer': 'Photosynthèse'},
    {'question': 'Quel est le plus grand organe du corps humain ?', 'answer': 'Peau'},
    {'question': 'Quel type de cellules sont les globules rouges ?', 'answer': 'Érythrocytes'},
    {'question': 'Comment s\'appelle l\'étude des fossiles ?', 'answer': 'Paléontologie'},
    {'question': 'Quel gaz est essentiel pour la respiration ?', 'answer': 'Oxygène'},
    {'question': 'Quel est le processus par lequel les organismes produisent des descendants ?', 'answer': 'Reproduction'},
    {'question': 'Quelle est la fonction principale du système circulatoire ?', 'answer': 'Transport des nutriments et de l\'oxygène'},
    {'question': 'Quels sont les éléments constitutifs des protéines ?', 'answer': 'Acides aminés'},
    {'question': 'Quelle est la fonction du noyau dans une cellule ?', 'answer': 'Centre de contrôle ; contient de l\'ADN'},
    {'question': 'Quel est le processus de conversion de la nourriture en énergie ?', 'answer': 'Respiration cellulaire'},
    {'question': 'Quels sont les principaux organes du système respiratoire ?', 'answer': 'Poumons'},
    // Ajoutez plus de questions et de réponses ici
    {'question': 'Quel est le nom du pigment responsable de la photosynthèse ?', 'answer': 'Chlorophylle'},
    {'question': 'Quelle est l\'organelle responsable de la synthèse des protéines ?', 'answer': 'Ribosome'},
    {'question': 'Quel est le nom scientifique du processus de division cellulaire ?', 'answer': 'Mitose'},
    {'question': 'Quel est le processus par lequel les plantes perdent la vapeur d\'eau à travers leurs feuilles ?', 'answer': 'Transpiration'},
    {'question': 'Comment s\'appellent les petites structures semblables à des poils à la surface de certaines cellules ?', 'answer': 'Cils'},
    {'question': 'Quel est le processus par lequel les organismes décomposent le glucose pour libérer de l\'énergie sans utiliser d\'oxygène ?', 'answer': 'Fermentation'},
    {'question': 'Quel est le liquide à l\'intérieur d\'une cellule qui contient des organites appelés ?', 'answer': 'Cytoplasme'},
    {'question': 'Quel scientifique est connu comme le père de la génétique ?', 'answer': 'Gregor Mendel'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biologie'),
        backgroundColor: Colors.green, // Définissez la couleur de la barre d'applications en vert
      ),
      backgroundColor: Colors.white, // Définissez la couleur de fond en blanc
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: quizData.length,
          itemBuilder: (context, index) {
            // Déterminez la couleur de la boîte de question
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
                    'Question ${index + 1} :',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '${quizData[index]['question']}',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Réponse :',
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
