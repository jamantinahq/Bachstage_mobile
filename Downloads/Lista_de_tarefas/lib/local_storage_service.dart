import 'package:shared_preferences/shared_preferences.dart';
import 'model/classe/tarefa.dart';

class LocalStorageService {
  static const String LISTA_TAREFAS = 'lista_tarefas';

  static Future<void> salvarTarefas(List<Tarefa> lista) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String encodedData = Tarefa.encode(lista);
    await prefs.setString(LISTA_TAREFAS, encodedData);
  }

  static Future<List<Tarefa>> carregarTarefas() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? tarefasJson = prefs.getString(LISTA_TAREFAS);

    if (tarefasJson == null) return [];

    return Tarefa.decode(tarefasJson);
  }
}
