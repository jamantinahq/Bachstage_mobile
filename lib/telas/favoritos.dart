import 'package:bachstage_mobile/widgets/eventos_card.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import '../modelo/classes/evento.dart';
import '../modelo/classes/favorito.dart';
import '../controle/eventoController.dart';
import '../controle/favoritosController.dart';
import '../controle/usuarioController.dart';

class Favoritos extends StatefulWidget {
  const Favoritos({super.key});

  @override
  State<Favoritos> createState() => _FavoritosState();
}

class _FavoritosState extends State<Favoritos> {
  List<favorito> _favoritos = [];
  List<Evento> _todosEventos = [];

  @override
  void initState() {
    super.initState();
    carregarFavoritos();
  }

  Future<void> carregarFavoritos() async {
    final usuario = await UsuarioController.usuarioLogado();
    if (usuario == null) {
      setState(() {
        _favoritos = [];
        _todosEventos = [];
      });
      return;
    }

    final todosFavoritos = await FavoritosController.listarFavoritos();
    final eventos = await EventoController.listarEventos();

    setState(() {
      _favoritos = todosFavoritos
          .where((f) => f.idUsuario == usuario.id)
          .toList();
      _todosEventos = eventos;
    });
  }

  Evento? _buscarEvento(int idEvento) {
    for (Evento e in _todosEventos) {
      if (e.id == idEvento) return e;
    }
    return null;
  }

  void removerFavorito(int idFavorito) async {
    await FavoritosController.deletarFavorito(idFavorito);
    carregarFavoritos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favoritos')),
      body: _favoritos.isEmpty
          ? const Center(child: Text("Você ainda não tem favoritos."))
          : ListView.builder(
              itemCount: _favoritos.length,
              itemBuilder: (context, index) {
                final fav = _favoritos[index];
                final evento = _buscarEvento(fav.idEvento);

                if (evento == null) return const SizedBox.shrink();

                return EventosCard(
                  imagem: evento.imagem,
                  nome: evento.nome,
                  local: evento.local,
                  data: evento.data,
                  descricao: evento.descricao,
                  onExcluir: () => removerFavorito(fav.id),
                );
              },
            ),
=======

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
>>>>>>> f053e02052f7b5fdeb3393a41ad71d0efe96d857
    );
  }
}
