import 'package:gerenciador_tarefas/local_storage_service.dart';
import 'package:gerenciador_tarefas/model/classe/tarefa.dart';

class TarefaController {
  static Future<void> inserirTarefa(String nome, String descricao) async {
    List<Tarefa> lista = await LocalStorageService.carregarTarefas();
    int novoId = lista.isEmpty
        ? 1
        : lista.map((tarefa) => tarefa.id).reduce((a, b) => a > b ? a : b) + 1;
    lista.add(
      Tarefa(
        id: novoId,
        nome: nome,
        descricao: descricao,
        concluida: false),
    );
    await LocalStorageService.salvarTarefas(lista);
  }

  static Future<void> deletarTarefa(int id) async {
    List<Tarefa> lista = await LocalStorageService.carregarTarefas();
    lista.removeWhere((tarefa) => tarefa.id == id);
    await LocalStorageService.salvarTarefas(lista);
  }

  static Future<void> atualizarTarefa(
    int id,
    String novoNome,
    String novaDescricao,
  ) async {
    List<Tarefa> lista = await LocalStorageService.carregarTarefas();
    int index = lista.indexWhere((tarefa) => tarefa.id == id);
    if (index != -1) {
      Tarefa tarefaAtual = lista[index];
      lista[index] = Tarefa(
        id: id,
        nome: novoNome,
        descricao: novaDescricao,
        concluida: tarefaAtual.concluida,
      );
      await LocalStorageService.salvarTarefas(lista);
    }
  }

  static Future<List<Tarefa>> listarTarefas() async {
    List<Tarefa> lista = await LocalStorageService.carregarTarefas();
    return lista;
  }

static Future<void> definirConclusao(int id, bool concluida) async {
  List<Tarefa> lista = await LocalStorageService.carregarTarefas();
  int index = lista.indexWhere((tarefa) => tarefa.id == id);
  if (index != -1) {
    Tarefa tarefa = lista[index];
    lista[index] = Tarefa(
      id: tarefa.id,
      nome: tarefa.nome,
      descricao: tarefa.descricao,
      concluida: concluida,
    );
    await LocalStorageService.salvarTarefas(lista);
  }
}

  static Future<void> buscarTarefa(int id) async {
    List<Tarefa> lista = await LocalStorageService.carregarTarefas();
    int index = lista.indexWhere((tarefa) => tarefa.id == id);
    if (index != -1) {
      Tarefa tarefa = lista[index];
      print(
        'Tarefa encontrada: ${tarefa.nome}, ${tarefa.descricao}, Concluída: ${tarefa.concluida}',
      );
    } else {
      print('Tarefa não encontrada.');
    }
  }
}
