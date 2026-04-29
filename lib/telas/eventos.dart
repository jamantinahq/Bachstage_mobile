import 'package:flutter/material.dart';
import '../widgets/eventos_card.dart';

class Eventos extends StatelessWidget {
  const Eventos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Eventos')),
      body: ListView(
        children: const [
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
          EventosCard(
            nome: "Orquestra Filarmonica BH",
            imagem: "assets/images/share-image.webp",
            local: "Salão de Minas",
            data: "25/05/2026 - 20:00",
            descricao: "orquestra.",
          ),
        ],
      ),
    );
  }
}
