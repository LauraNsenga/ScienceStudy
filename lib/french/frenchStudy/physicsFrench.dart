import 'package:flutter/material.dart';

class PhysicsPage extends StatelessWidget {
  final List<Map<String, String>> quizData = [
    {
      'question': 'Quelle est l\'unité SI de la force ?',
      'answer': 'Newton',
    },
    {
      'question': 'Quelle est l\'accélération due à la gravité sur Terre ?',
      'answer': '9,8 m/s²',
    },
    {
      'question': 'Quelle est l\'unité de la résistance électrique ?',
      'answer': 'Ohm',
    },
    {
      'question': 'Que dit la loi de l\'inertie ?',
      'answer': 'Un objet au repos reste au repos et un objet en mouvement reste en mouvement à moins qu\'une force externe n\'agisse sur lui',
    },
    {
      'question': 'Quelle est l\'unité SI du courant électrique ?',
      'answer': 'Ampère',
    },
    {
      'question': 'Quelle est la formule de l\'énergie cinétique ?',
      'answer': '1/2 * masse * vitesse^2',
    },
    {
      'question': 'Quelle est l\'unité SI de la puissance ?',
      'answer': 'Watt',
    },
    {
      'question': 'Quel est le principe de conservation de l\'énergie ?',
      'answer': 'L\'énergie ne peut ni être créée ni détruite, seulement transformée d\'une forme à une autre',
    },
    {
      'question': 'Quelle est la formule de la force gravitationnelle ?',
      'answer': 'G * (m1 * m2) / r^2',
    },
    {
      'question': 'Quelle est l\'unité SI de la pression ?',
      'answer': 'Pascal',
    },
    {
      'question': 'Quelle est la formule de la densité ?',
      'answer': 'Masse / Volume',
    },
    {
      'question': 'Quelle est l\'unité SI de la fréquence ?',
      'answer': 'Hertz',
    },
    {
      'question': 'Quel est le principe de conservation de la quantité de mouvement ?',
      'answer': 'La quantité totale de mouvement d\'un système fermé reste constante si aucune force externe n\'agit sur lui',
    },
    {
      'question': 'Quelle est la formule de la puissance électrique ?',
      'answer': 'Tension * Courant',
    },
    {
      'question': 'Quelle est l\'unité SI de l\'intensité du champ magnétique ?',
      'answer': 'Tesla',
    },
    {
      'question': 'Quelle est la formule de la force centripète ?',
      'answer': 'Masse * (Vitesse^2 / Rayon)',
    },
    {
      'question': 'Quel est le principe d\'Archimède ?',
      'answer': 'Un objet immergé dans un fluide subit une force de poussée ascendante égale au poids du fluide qu\'il déplace',
    },
    {
      'question': 'Quelle est la formule de la loi d\'Ohm ?',
      'answer': 'V = I * R (Tension = Courant * Résistance)',
    },
    {
      'question': 'Quelle est l\'unité SI de la charge électrique ?',
      'answer': 'Coulomb',
    },
    {
      'question': 'Quelle est la formule du couple ?',
      'answer': 'Force * Distance par rapport au point de pivot',
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Physique'),
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
