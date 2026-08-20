import 'package:flutter/material.dart';

class TarefaTemplate extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController tecNome;
  final TextEditingController tecDescricao;
  final VoidCallback onSalvar;
  final String tituloBotao;

  const TarefaTemplate({
    super.key,
    required this.formKey,
    required this.tecNome,
    required this.tecDescricao,
    required this.onSalvar,
    this.tituloBotao = "Salvar Tarefa",
  });

  static const _corFundo = Color(0xFF0F0F0F);
  static const _corCampo = Color(0xFF262626);
  static const _corAzul = Color(0xFF3B82F6);
  static const _corTextoClaro = Colors.white;
  static const _corTextoSecundario = Color(0xFF9CA3AF);

  InputDecoration _decoracaoCampo(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: _corTextoSecundario),
      filled: true,
      fillColor: _corCampo,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: _corAzul, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.redAccent, width: 1.2),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _corFundo,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: tecNome,
                style: const TextStyle(color: _corTextoClaro),
                decoration: _decoracaoCampo("Nome da Tarefa"),
                validator: (valor) {
                  if (valor == null || valor.trim().isEmpty) {
                    return "Informe o nome da tarefa";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: tecDescricao,
                style: const TextStyle(color: _corTextoClaro),
                maxLines: 4,
                decoration: _decoracaoCampo("Descrição da Tarefa"),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: onSalvar,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _corAzul,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  tituloBotao,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}