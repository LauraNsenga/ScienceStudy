import 'package:flutter/material.dart';

class BiologyPageSpanish extends StatelessWidget {
  final List<Map<String, String>> quizData = [
    {'question': '¿Cuál es la central energética de la célula?', 'answer': 'Mitocondria'},
    {'question': '¿Cuál es el proceso mediante el cual las plantas elaboran su propio alimento?', 'answer': 'Fotosíntesis'},
    {'question': '¿Cuál es el órgano más grande del cuerpo humano?', 'answer': 'Piel'},
    {'question': '¿Qué tipo de células son los glóbulos rojos?', 'answer': 'Eritrocitos'},
    {'question': '¿Cómo se llama el estudio de los fósiles?', 'answer': 'Paleontología'},
    {'question': '¿Qué gas es esencial para la respiración?', 'answer': 'Oxígeno'},
    {'question': '¿Cuál es el proceso mediante el cual los organismos producen descendencia?', 'answer': 'Reproducción'},
    {'question': '¿Cuál es la función principal del sistema circulatorio?', 'answer': 'Transporte de nutrientes y oxígeno'},
    {'question': '¿Cuáles son los componentes básicos de las proteínas?', 'answer': 'Aminoácidos'},
    {'question': '¿Cuál es la función del núcleo en una célula?', 'answer': 'Centro de control; contiene ADN'},
    {'question': '¿Cuál es el proceso de convertir los alimentos en energía?', 'answer': 'Respiración celular'},
    {'question': '¿Cuáles son los órganos principales del sistema respiratorio?', 'answer': 'Pulmones'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biología'),
        backgroundColor: Colors.green, // Set app bar color to green
      ),
      backgroundColor: Colors.white, // Set background color to white
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: quizData.length,
          itemBuilder: (context, index) {
            // Determine the color of the question box
            Color boxColor = index % 2 == 0 ? Colors.lightGreen.shade100 : Colors.lightGreen.shade200;

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
                    'Pregunta ${index + 1}:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '${quizData[index]['question']}',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Respuesta:',
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
