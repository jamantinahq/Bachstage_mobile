import 'package:flutter/material.dart';
import 'package:gerenciador_tarefas/model/classe/tarefa.dart';
import '../controller/tarefasController.dart';
import 'adicionar.dart';
import 'atualizar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  List<Tarefa> _tarefas = [];
  bool _modoExcluir = false;
  String _termoPesquisa = '';

  @override
  void initState() {
    super.initState();
    carregarTarefas();
  }

  Future<void> carregarTarefas() async {
    final tarefas = await TarefaController.listarTarefas();
    setState(() {
      _tarefas = tarefas;
    });
  }

  void abrirTelaAdicionar() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Adicionar()),
    );
    carregarTarefas();
  }

  void abrirTelaAtualizar(Tarefa tarefa) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Atualizar(tarefa: tarefa)),
    );
    carregarTarefas();
  }

  Future<void> excluirTarefa(int id) async {
    await TarefaController.deletarTarefa(id);
    await carregarTarefas();
  }

  @override
  Widget build(BuildContext context) {
    final tarefasExibidas = _tarefas
        .where(
          (t) => t.nome.toLowerCase().contains(_termoPesquisa.toLowerCase()),
        )
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F0F0F),
        title: const Text(
          'Bloco de Notas',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: Color(0xFF3B82F6),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.delete_outline,
              color: _modoExcluir ? Colors.redAccent : Colors.white,
            ),
            onPressed: () => setState(() => _modoExcluir = !_modoExcluir),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: abrirTelaAdicionar,
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                hintText: 'Pesquisar tarefa...',
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Color(0xFF262626),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (valor) => setState(() => _termoPesquisa = valor),
            ),
          ),
          Expanded(
            child: tarefasExibidas.isEmpty
                ? const Center(
                    child: Text(
                      "Nenhuma tarefa cadastrada",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                : ListView.builder(
                    itemCount: tarefasExibidas.length,
                    itemBuilder: (context, index) {
                      final tarefa = tarefasExibidas[index];

                      return Card(
                        color: const Color(0xFF262626),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        margin: const EdgeInsets.all(10),
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(minHeight: 100),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(10),
                            onTap: _modoExcluir
                                ? () => excluirTarefa(tarefa.id)
                                : null,
                            title: Text(
                              tarefa.nome,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 123, 165, 231),
                              ),
                            ),
                            subtitle: Text(
                              tarefa.descricao,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xFFF9FAFB),
                              ),
                            ),
                             trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Checkbox(
                                  value: tarefa.concluida,
                                  activeColor: const Color(0xFF3B82F6),
                                  onChanged: (bool? valor) async {
                                    if (valor == true) {
                                      await TarefaController.definirConclusao(
                                        tarefa.id,
                                        true,
                                      );
                                    } else {
                                      await TarefaController.definirConclusao(
                                        tarefa.id,
                                        false,
                                      );
                                    }
                                    await carregarTarefas();
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Color(0xFF3B82F6),
                                  ),
                                  onPressed: () => abrirTelaAtualizar(tarefa),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}