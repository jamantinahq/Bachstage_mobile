import 'package:flutter/material.dart';

class EventosCard extends StatelessWidget {
  final String nome;
  final String imagem;
  final String local;
  final String data;
  final String descricao;

  const EventosCard({
    super.key,
    required this.nome,
    required this.imagem,
    required this.local,
    required this.data,
    required this.descricao,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagem,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nome,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text("Local: $local"),
                const SizedBox(height: 8),
                Text("Data e hora $data"),
                const SizedBox(height: 8),
                Text(descricao),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite, color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
