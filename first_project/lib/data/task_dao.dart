import 'package:first_project/components/task.dart';
import 'package:first_project/data/databse.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_difficulty INTERGER, '
      '$_image TEXT)';

  static const String _tablename = 'tarefasTabela';
  static const String _difficulty = 'dificuldade';
  static const String _name = 'nome';
  static const String _image = 'imagem';

  save(Task tarefa) async {
    print('Save iniciado');

    final Database bancoDeDados = await getDatabase();
    var itemExist = await find(tarefa.nome);
    Map<String, dynamic> taskMap = toMap(tarefa);
    if (itemExist.isEmpty) {
      print('Tarefa não existia');
      return await bancoDeDados.insert(_tablename, taskMap);
    } else {
      print('Ja existe a tarefa');
      return await bancoDeDados.update(_tablename, taskMap,
          where: '$_name = ?', whereArgs: [tarefa.nome]);
    }
  }

  Map<String, dynamic> toMap(Task tarefa) {
    print('Convertendo pra Map');

    final Map<String, dynamic> mapaDeTarefas = Map();
    mapaDeTarefas[_name] = tarefa.nome;
    mapaDeTarefas[_difficulty] = tarefa.difficulty;
    mapaDeTarefas[_image] = tarefa.foto;
    print('Mpa de tarefas é $mapaDeTarefas');
    return mapaDeTarefas;
  }

  Future<List<Task>> findAll() async {
    print('Acessando findAll');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result =
        await bancoDeDados.query(_tablename);
    print('Procurando... Encontrado: $result');
    return toList(result);
  }

  List<Task> toList(List<Map<String, dynamic>> mapaDeTarefas) {
    final List<Task> tarefas = [];
    for (Map<String, dynamic> linha in mapaDeTarefas) {
      final Task tarefa = Task(linha[_name], linha[_image], linha[_difficulty]);
      tarefas.add(tarefa);
    }
    print('Lista de tarefas $tarefas');
    return tarefas;
  }

  Future<List<Task>> find(String nomeDaTarefa) async {
    print('Acessando find');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(
      _tablename,
      where: '$_name = ?',
      whereArgs: [nomeDaTarefa],
    );
    print('Tarefa encontrada: ${toList(result)}');
    return toList(result);
  }

  delete(String nomeDaTarefa) async {
    print('Deletando $nomeDaTarefa');

    final Database bancoDeDados = await getDatabase();
    return bancoDeDados
        .delete(_tablename, where: '$_name = ? ', whereArgs: [nomeDaTarefa]);
  }
}
