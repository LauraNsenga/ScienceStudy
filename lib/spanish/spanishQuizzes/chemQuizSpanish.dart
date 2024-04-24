import 'dart:math';
import 'package:flutter/material.dart';

class PaginaQuizQuimica extends StatefulWidget {
  const PaginaQuizQuimica({Key? key}) : super(key: key);

  @override
  _EstadoPaginaQuizQuimica createState() => _EstadoPaginaQuizQuimica();
}

class _EstadoPaginaQuizQuimica extends State<PaginaQuizQuimica> {
  final List<Map<String, String>> datosQuiz = [
    {
      'question': '¿Cuál es el símbolo químico del agua?',
      'answer': 'H2O',
    },
    {
      'question': '¿Cuál es el número atómico del oxígeno?',
      'answer': '8',
    },
    {
      'question': '¿Cuál es la fórmula del ácido sulfúrico?',
      'answer': 'H2SO4',
    },
    {
      'question': '¿Cuál es el símbolo químico del sodio?',
      'answer': 'Na',
    },
    {
      'question': '¿Cuál es el gas más abundante en la atmósfera terrestre?',
      'answer': 'Nitrógeno',
    },
    {
      'question': '¿Qué mide la escala de pH?',
      'answer': 'Acidez o alcalinidad de una sustancia',
    },
    {
      'question': '¿Cuál es el símbolo químico del oro?',
      'answer': 'Au',
    },
    {
      'question': '¿Cuál es la fórmula química de la sal de mesa?',
      'answer': 'NaCl',
    },
    {
      'question': '¿Qué proceso de división de átomos se llama?',
      'answer': 'Fisión nuclear',
    },
    {
      'question': '¿Cuál es el símbolo químico del helio?',
      'answer': 'He',
    },
    // Agregar más preguntas y respuestas aquí
  ];

  List<Map<String, String>> preguntasSeleccionadas = [];

  @override
  void initState() {
    super.initState();
    seleccionarPreguntasAleatorias();
  }

  void seleccionarPreguntasAleatorias() {
    final random = Random();
    final Set<int> indicesSeleccionados = {};

    while (indicesSeleccionados.length < 10) {
      final indice = random.nextInt(datosQuiz.length);
      indicesSeleccionados.add(indice);
    }

    preguntasSeleccionadas = indicesSeleccionados
        .map((indice) => datosQuiz[indice])
        .toList(growable: false);
  }

  Map<int, String?> _respuestasSeleccionadas = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz de Química'),
        backgroundColor: Color.fromARGB(255, 127, 45, 214),
      ),
      backgroundColor: Color.fromARGB(255, 14, 200, 237),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: preguntasSeleccionadas.length,
          itemBuilder: (context, index) {
            final pregunta = preguntasSeleccionadas[index];
            final List<String> opciones =
            generarOpcionesAleatorias(pregunta['answer']!);
            final seSeleccionoRespuesta =
            _respuestasSeleccionadas.containsKey(index);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pregunta ${index + 1}: ${pregunta['question']}',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 8),
                Column(
                  children: opciones.map((opcion) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: RadioListTile(
                        title: Text(opcion),
                        groupValue: _respuestasSeleccionadas[index],
                        value: opcion,
                        onChanged: seSeleccionoRespuesta
                            ? null
                            : (valor) {
                          setState(() {
                            _respuestasSeleccionadas[index] =
                            valor as String?;
                          });
                        },
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 8),
                if (seSeleccionoRespuesta)
                  _respuestasSeleccionadas[index] == pregunta['answer']
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
          final puntaje = calcularPuntaje();
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Resultado del Quiz'),
                content: Text(puntaje >= 7
                    ? '¡Felicidades! Pasaste el quiz con un puntaje de $puntaje.'
                    : '¡Ups! No pasaste el quiz. Tu puntaje es de $puntaje.'),
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

  List<String> generarOpcionesAleatorias(String respuestaCorrecta) {
    final List<String> todasOpciones = [];
    todasOpciones.add(respuestaCorrecta);

    while (todasOpciones.length < 4) {
      final indiceAleatorio = Random().nextInt(datosQuiz.length);
      final opcion = datosQuiz[indiceAleatorio]['answer'];
      if (!todasOpciones.contains(opcion)) {
        todasOpciones.add(opcion!);
      }
    }

    todasOpciones.shuffle();
    return todasOpciones;
  }

  int calcularPuntaje() {
    int puntaje = 0;
    for (int i = 0; i < preguntasSeleccionadas.length; i++) {
      final pregunta = preguntasSeleccionadas[i];
      final respuestaCorrecta = pregunta['answer'];
      final respuestaSeleccionada = _respuestasSeleccionadas[i];
      if (respuestaSeleccionada == respuestaCorrecta) {
        puntaje++;
      }
    }
    return puntaje;
  }
}
