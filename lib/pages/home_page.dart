import 'package:flutter/material.dart';
import 'opening_page.dart';
import 'scienceFlashCards/biology.dart';
import 'scienceFlashCards/physics.dart';
import 'scienceFlashCards/chemistry.dart';
import 'englishQuiz/quizzes.dart'; // Import the QuizzesPage

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); // Step 1: Create a GlobalKey

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Step 1: Assign the key to the Scaffold
      appBar: AppBar(
        title: Text('Study App', textAlign: TextAlign.center),
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
              'Hello, Cecilia',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.normal,
                color: Colors.green, // Set font color to green
              ),
            ),
            SizedBox(height: 8), // Add space between greeting and select statement
            Text(
              'Select the topic you would like to study today below:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16), // Add space between message and buttons
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BiologyPage(),
                  ),
                );
              },
              child: Text(
                'Biology',
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
                    builder: (context) => PhysicsPage(),
                  ),
                );
              },
              child: Text(
                'Physics',
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
                    builder: (context) => ChemistryPage(),
                  ),
                );
              },
              child: Text(
                'Chemistry',
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
                    builder: (context) => QuizzesPage(),
                  ),
                );
              },
              child: Text(
                'Quizzes',
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
                title: Text('Sign out'),
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
          'Welcome to the $subject subject screen!',
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
