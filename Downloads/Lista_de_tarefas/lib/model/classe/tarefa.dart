import 'dart:convert';

class Tarefa {
  final int id;
  final String nome;
  final String descricao;
  final bool concluida;

  Tarefa({
    required this.id,
    required this.nome,
    required this.descricao,
    this.concluida = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'descricao': descricao,
      'concluida': concluida,
    };
  }

  factory Tarefa.fromMap(Map<String, dynamic> map) {
    return Tarefa(
      id: map['id'] ?? 0,
      nome: map['nome'] ?? '',
      descricao: map['descricao'] ?? '',
      concluida: map['concluida'] ?? false,
    );
  }

  static String encode(List<Tarefa> tarefas) =>
      json.encode(tarefas.map<Map<String, dynamic>>((t) => t.toMap()).toList());

  static List<Tarefa> decode(String tarefasJson) =>
      (json.decode(tarefasJson) as List<dynamic>)
          .map<Tarefa>((item) => Tarefa.fromMap(item))
          .toList();
}
