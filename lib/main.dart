import 'package:first_app/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clean Air Monitor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark, // Dark theme
        fontFamily: 'Roboto', // You can change the font family
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0), // Adjust height here
        child: AppBar(
          backgroundColor: Colors.black,
        //  title: const Text(
        //    'Discover',
         //   style: TextStyle(color: Colors.white, fontSize: 24), // Custom title size
       //   ),
          centerTitle: true,
        ),
      ),
      

  body: Container(
    width: double.infinity,
    padding: const EdgeInsets.all(20),
     decoration: const BoxDecoration(
  image: DecorationImage(
    image: AssetImage('assets/satelite3.jpg'), // Your background image
    fit: BoxFit.cover,
    alignment: Alignment(0, 0.2), // Adjust the vertical alignment of the image (positive values move it down)
  ),
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF481FCE), // Purple
      Color(0xFF342070), // Dark purple
      Color(0xFF2C224F), // Dark slate
      Color(0xFF232229), // Near black
    ],
    stops: [0.1, 0.4, 0.7, 1.0],
  ),
),

    

    
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Empowering Clean Air Monitor',
          style: TextStyle(
            fontSize: 29,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        const Text(
          'Reduce and Transform Factory Emissions with AI-Powered',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Text(
          'Our innovative platform tracks factory emissions in real-time and provides actionable insights to help industries reduce their carbon footprint and contribute to a healthier, cleaner environment.',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey[300],
          ),
          textAlign: TextAlign.center,
        ),
        //const SizedBox(height: 50),
        //Image.asset(
          //'assets/satellite.png', // Replace with your satellite image
         // height: 300,
        //),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()), // Navigate to SecondScreen
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 62, 40, 175), // Button color
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: const Text('Start Now'),
            ),
            const SizedBox(width: 20),
          ],
        ),
      ],
    ),
  ),
);


  }
}

