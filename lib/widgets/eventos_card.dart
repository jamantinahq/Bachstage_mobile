<<<<<<< HEAD
import 'dart:io';
=======
>>>>>>> f053e02052f7b5fdeb3393a41ad71d0efe96d857
import 'package:flutter/material.dart';

class EventosCard extends StatelessWidget {
  final String nome;
  final String imagem;
  final String local;
  final String data;
  final String descricao;
<<<<<<< HEAD
  final VoidCallback? onEditar;
  final VoidCallback? onExcluir;
  final VoidCallback? onFavoritar;
=======
>>>>>>> f053e02052f7b5fdeb3393a41ad71d0efe96d857

  const EventosCard({
    super.key,
    required this.nome,
    required this.imagem,
    required this.local,
    required this.data,
    required this.descricao,
<<<<<<< HEAD
    this.onEditar,
    this.onExcluir,
    this.onFavoritar,
  });

  Widget _buildImagem() {
    if (imagem.startsWith('assets/')) {
      return Image.asset(
        imagem,
        height: 200,
        width: double.infinity,
        fit: BoxFit.cover,
      );
    }
    return Image.file(
      File(imagem),
      height: 200,
      width: double.infinity,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => Container(
        height: 200,
        color: Colors.grey.shade300,
        child: const Icon(Icons.broken_image, size: 48),
      ),
    );
  }

=======
  });

>>>>>>> f053e02052f7b5fdeb3393a41ad71d0efe96d857
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
<<<<<<< HEAD
          _buildImagem(),
=======
          Image.asset(
            imagem,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
>>>>>>> f053e02052f7b5fdeb3393a41ad71d0efe96d857
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
<<<<<<< HEAD
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (onEditar != null)
                        IconButton(
                          onPressed: onEditar,
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.deepPurple,
                          ),
                        ),
                      if (onExcluir != null)
                        IconButton(
                          onPressed: onExcluir,
                          icon: const Icon(Icons.delete, color: Colors.red),
                        ),
                      if (onEditar == null && onExcluir == null)
                        IconButton(
                          onPressed: onFavoritar,
                          icon: const Icon(Icons.favorite, color: Colors.red),
                        ),
                    ],
=======
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite, color: Colors.red),
>>>>>>> f053e02052f7b5fdeb3393a41ad71d0efe96d857
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
