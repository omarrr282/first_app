import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key, this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Background image restricted to the top section
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/satelite1.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.35, // Restrict height
            ),
          ),
          SafeArea(
            child: child!,
          ),
        ],
      ),
    );
  }
}
