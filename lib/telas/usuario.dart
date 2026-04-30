import 'package:flutter/material.dart';
import 'login.dart';

class Perfil extends StatelessWidget {
  const Perfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Meu Perfil")),

      body: Padding(
        padding: const EdgeInsets.all(25),

        child: Column(
          children: [
            const SizedBox(height: 40),

            // foto
            CircleAvatar(
              radius: 45,
              backgroundColor: Colors.deepPurple.shade100,
              child: const Icon(
                Icons.person,
                size: 50,
                color: Colors.deepPurple,
              ),
            ),

            const SizedBox(height: 20),

            // nome
            const Text(
              "Augusto Cesar",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            // email
            const Text(
              "gutosousa002@gmail.com",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 15),
            // botao de sair
            SizedBox(
              width: double.infinity,
              height: 55,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.red, width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Sair da Conta",
                  style: TextStyle(color: Colors.red, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
