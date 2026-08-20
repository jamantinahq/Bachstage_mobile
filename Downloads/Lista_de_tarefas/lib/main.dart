import 'package:flutter/material.dart';
import 'telas/splash.dart';
import 'telas/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bloco de Notas',

      initialRoute: '/',
      onGenerateInitialRoutes: (initialRoute) {
        return [MaterialPageRoute(builder: (context) => const SplashScreen())];
      },
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
