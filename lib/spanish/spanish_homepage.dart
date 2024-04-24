import 'package:flutter/material.dart';
import '../pages/opening_page.dart';
import 'spanishSubject/BiologyPageSpanish.dart';
import 'spanishSubject/PhysicsSpanish.dart';
import 'QuizzesSpanish.dart';
import 'spanishSubject/chemistrySpanish.dart'; // Import the AuthController

class SpanishHomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); // Step 1: Create a GlobalKey

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Step 1: Assign the key to the Scaffold
      appBar: AppBar(
        title: Text('Aplicación de Estudio - Español', textAlign: TextAlign.center),
        centerTitle: true,
        backgroundColor: Colors.green, // Set app bar color to green
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Open the drawer when the menu icon is pressed
            _scaffoldKey.currentState!.openDrawer(); // Step 2: Use the key to open the drawer
          },
        ),
      ),
      backgroundColor: Colors.white, // Set background color to white
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch buttons horizontally
          children: [
            Text(
              'Hola, Cecilia',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.normal,
                color: Colors.green, // Set font color to green
              ),
            ),
            SizedBox(height: 8), // Add space between greeting and select statement
            Text(
              'Selecciona el tema que te gustaría estudiar hoy:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16), // Add space between message and buttons
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BiologyPageSpanish(),
                  ),
                );
              },
              child: Text(
                'Biología',
                style: TextStyle(color: Colors.black), // Set font color to black
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.lightGreen[100]!), // Set button background color to light green
              ),
            ),
            SizedBox(height: 16), // Add space between buttons
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PhysicsPageSpanish(),
                  ),
                );
              },
              child: Text(
                'Física',
                style: TextStyle(color: Colors.black), // Set font color to black
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.lightGreen[100]!), // Set button background color to light green
              ),
            ),
            SizedBox(height: 16), // Add space between buttons
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChemistryPageSpanish(),
                  ),
                );
              },
              child: Text(
                'Química',
                style: TextStyle(color: Colors.black), // Set font color to black
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.lightGreen[100]!), // Set button background color to light green
              ),
            ),
            SizedBox(height: 16), // Add space between buttons
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizzesPageSpanish(),
                  ),
                );
              },
              child: Text(
                'Cuestionarios',
                style: TextStyle(color: Colors.black), // Set font color to black
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.lightGreen[100]!), // Set button background color to light green
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
                title: Text('Volver a inicio'),
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
  final String asignatura;

  SubjectScreen({required this.asignatura});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(asignatura),
      ),
      body: Center(
        child: Text(
          '¡Bienvenido a la pantalla de $asignatura!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SpanishHomePage(),
  ));
}
