import 'dart:math';
import 'package:flutter/material.dart';

class PaginaQuizFisica extends StatefulWidget {
  const PaginaQuizFisica({Key? key}) : super(key: key);

  @override
  _EstadoPaginaQuizFisica createState() => _EstadoPaginaQuizFisica();
}

class _EstadoPaginaQuizFisica extends State<PaginaQuizFisica> {
  final List<Map<String, String>> datosQuiz = [
    {
      'question': '¿Cuál es la unidad SI de la fuerza?',
      'answer': 'Newton',
    },
    {
      'question': '¿Cuál es la aceleración debido a la gravedad en la Tierra?',
      'answer': '9,8 m/s²',
    },

    {
      'question': '¿Cuál es la unidad de la resistencia eléctrica?',
      'answer': 'Ohmio',
    },
    {
      'question': '¿Qué establece la Ley de Inercia?',
      'answer':
      'Un objeto en reposo permanecerá en reposo y un objeto en movimiento permanecerá en movimiento a menos que actúe sobre él una fuerza externa',
    },

    {
      'question': '¿Cuál es la unidad SI de la corriente eléctrica?',
      'answer': 'Amperio',
    },
    {
      'question': '¿Cuál es la fórmula de la energía cinética?',
      'answer': '1/2 * masa * velocidad^2',
    },

    {
      'question': '¿Cuál es la unidad SI de la potencia?',
      'answer': 'Vatio',
    },
    {
      'question': '¿Cuál es el principio de conservación de la energía?',
      'answer': 'La energía no puede ser creada ni destruida, solo transformada de una forma a otra',
    },

    {
      'question': '¿Cuál es la fórmula de la fuerza gravitacional?',
      'answer': 'G * (m1 * m2) / r^2',
    },
    {
      'question': '¿Cuál es la unidad SI de la presión?',
      'answer': 'Pascal',
    },
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
        title: Text('Quiz de Física'),
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
            final respuestaSeleccionada =
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
                        onChanged: respuestaSeleccionada
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
                if (respuestaSeleccionada)
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
                    : '¡Oops! No pasaste el quiz. Tu puntaje es $puntaje.'),
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
}
