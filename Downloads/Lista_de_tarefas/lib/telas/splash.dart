import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _TempoSplash();
}

class _TempoSplash extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color (0xFF0F0F0F),
      body: Center(
 child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(height: 5),
      CircularProgressIndicator(
        color: Color.fromARGB(255, 123, 165, 231),
      ),
    ],
  ),
),
    );
  }
}