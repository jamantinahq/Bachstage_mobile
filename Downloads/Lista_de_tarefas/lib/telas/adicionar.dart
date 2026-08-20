import 'package:flutter/material.dart';
import '../controller/tarefasController.dart';
import '../widgets/template.dart';

class Adicionar extends StatefulWidget {
  const Adicionar({super.key});

  @override
  State<Adicionar> createState() => _AdicionarState();
}

class _AdicionarState extends State<Adicionar> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController tecNome = TextEditingController();
  final TextEditingController tecDescricao = TextEditingController();

  @override
  void dispose() {
    tecNome.dispose();
    tecDescricao.dispose();
    super.dispose();
  }

  void salvarTarefa() async {
    if (!_formKey.currentState!.validate()) return;

    await TarefaController.inserirTarefa(tecNome.text, tecDescricao.text);

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
          "Criar Tarefa",
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
      ),
    );
  }
}