import 'package:flutter/material.dart';
import '../widgets/eventos_card.dart';
<<<<<<< HEAD
import '../modelo/classes/evento.dart';
import '../controle/eventoController.dart';
import '../controle/usuarioController.dart';
import '../controle/favoritosController.dart';

class Eventos extends StatefulWidget {
  const Eventos({super.key});

  @override
  State<Eventos> createState() => _EventosState();
}

class _EventosState extends State<Eventos> {
  List<Evento> _todosEventos = []; 
  List<Evento> _eventosFiltrados = []; 

  @override
  void initState() {
    super.initState();
    carregarEventos();
  }

  Future<void> carregarEventos() async {
    final eventos = await EventoController.listarEventos();
    setState(() {
      _todosEventos = eventos;
      _eventosFiltrados = eventos;
    });
  }

    Future<void> favoritarEvento(Evento evento) async {
    final usuario = await UsuarioController.usuarioLogado();
    if (usuario == null) return;

    final id = DateTime.now().millisecondsSinceEpoch;
    await FavoritosController.adicionarFavorito(id, usuario.id, evento.id);

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Adicionado aos favoritos!")),
    );
  }

  void buscar(String termo) {
    setState(() {
      _eventosFiltrados = _todosEventos
          .where((e) => e.nome.toLowerCase().contains(termo.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Eventos")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Pesquisar evento...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onChanged: buscar,
            ),
          ),
          Expanded(
            child: _eventosFiltrados.isEmpty
                ? const Center(child: Text("Nenhum evento encontrado."))
                : ListView.builder(
                    itemCount: _eventosFiltrados.length,
                    itemBuilder: (context, index) {
                      final evento = _eventosFiltrados[index];
                      return EventosCard(
                        imagem: evento.imagem,
                        nome: evento.nome,
                        local: evento.local,
                        data: evento.data,
                        descricao: evento.descricao,
                        onFavoritar: () => favoritarEvento(evento),
                      );
                    },
                  ),
=======

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
>>>>>>> f053e02052f7b5fdeb3393a41ad71d0efe96d857
          ),
        ],
      ),
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> f053e02052f7b5fdeb3393a41ad71d0efe96d857
