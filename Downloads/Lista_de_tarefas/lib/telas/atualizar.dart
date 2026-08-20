import 'package:flutter/material.dart';
import '../controller/tarefasController.dart';
import '../model/classe/tarefa.dart';
import '../widgets/template.dart';

class Atualizar extends StatefulWidget {
  final Tarefa tarefa;

  const Atualizar({super.key, required this.tarefa});

  @override
  State<Atualizar> createState() => _AtualizarState();
}

class _AtualizarState extends State<Atualizar> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController tecNome = TextEditingController();
  final TextEditingController tecDescricao = TextEditingController();

  @override
  void initState() {
    super.initState();
    tecNome.text = widget.tarefa.nome;
    tecDescricao.text = widget.tarefa.descricao;
  }

  @override
  void dispose() {
    tecNome.dispose();
    tecDescricao.dispose();
    super.dispose();
  }

  void salvarTarefa() async {
    if (!_formKey.currentState!.validate()) return;

    await TarefaController.atualizarTarefa(
      widget.tarefa.id,
      tecNome.text,
      tecDescricao.text,
    );

    if (!mounted) return;
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F0F0F),
        title: const Text(
          "Atualizar Tarefa",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Color(0xFF3B82F6),
          ),
        ),
      ),
      body: TarefaTemplate(
        formKey: _formKey,
        tecNome: tecNome,
        tecDescricao: tecDescricao,
        onSalvar: salvarTarefa,
        tituloBotao: "Atualizar Tarefa",
      ),
    );
  }
}