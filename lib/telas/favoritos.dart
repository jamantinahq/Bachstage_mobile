import 'package:bachstage_mobile/widgets/eventos_card.dart';
import 'package:flutter/material.dart';

class Favoritos extends StatelessWidget {
  const Favoritos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favoritos')),
      body: ListView(
        children: [
          EventosCard(
            nome: "Show imagine Dragons",
            imagem: "assets/images/IMAGINE_DRAGONS_.webp",
            local: "Matriz",
            data: "12/05/2026 - 20:00",
            descricao: "show do imagine dragões.",
          ),
          EventosCard(
            nome: "Show do Rock In Rio",
            imagem: "assets/images/rock-in-rio-2022_8054.jpeg",
            local: "Matriz",
            data: "22/07/2026 - 10:00",
            descricao: "Rock nos Rios.",
          ),
        ],
      ),
    );
  }
}
