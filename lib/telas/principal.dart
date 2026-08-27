import 'package:flutter/material.dart';
import 'eventos.dart';
<<<<<<< HEAD
import 'favoritos.dart';
import 'usuario.dart';
import 'meus_eventos.dart';
=======
import 'busca.dart';
import 'favoritos.dart';
import 'usuario.dart';
>>>>>>> f053e02052f7b5fdeb3393a41ad71d0efe96d857

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _telas();
}
//controla a que é tela exibida
class _telas extends State<Principal> {
  int paginaAtual = 0;

  final List<Widget> telas = [
    const Eventos(),
<<<<<<< HEAD
    const MeusEventos(),
=======
    const Busca(),
>>>>>>> f053e02052f7b5fdeb3393a41ad71d0efe96d857
    const Favoritos(),
    const Perfil(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: telas[paginaAtual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: paginaAtual,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,

        onTap: (index) {
          setState(() {
            paginaAtual = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
<<<<<<< HEAD
          BottomNavigationBarItem(icon: Icon(Icons.celebration),label: "Meus Eventos"),
=======
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Buscar"),
>>>>>>> f053e02052f7b5fdeb3393a41ad71d0efe96d857
          BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "Favoritos"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
        ],
      ),
    );
  }
}
