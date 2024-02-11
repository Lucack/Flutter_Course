import 'package:first_project/components/task.dart';
import 'package:flutter/material.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    super.key,
    required Widget child,
  }) : super(child: child);

   final List<Task> taskList = [
    Task('Aprender Flutter',
        'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large', 3),
    Task(
        'Estudar Inglês',
        'https://img.freepik.com/vetores-gratis/fundo-de-livro-em-ingles-desenhado-a-mao_23-2149483336.jpg?w=740&t=st=1706116710~exp=1706117310~hmac=6f31e0bea4893f8082c68d2c602b87102252e5712f84d39470841cfbbc5ae303',
        2),
    Task(
        'Terminar Artigo',
        'https://img.freepik.com/vetores-gratis/pessoa-escrevendo-ilustracao-em-vetor-plana-carta-de-amor-caneta-na-mao-humana-pessoa-que-envia-ou-recebe-carta-correspondencia-comunicacao-relacionamento-conceito-de-amizade_74855-24968.jpg?w=740&t=st=1706116749~exp=1706117349~hmac=0db77fdd6ddf412bc3244b946df443b277d19c67092f7dfc230944d08873d1ba',
        4),
    Task(
        'Comprar Impressora',
        'https://img.freepik.com/vetores-gratis/impressora_53876-59954.jpg?w=740&t=st=1706116777~exp=1706117377~hmac=90ca45a305bc43324d1c04bce5b29d87df2758e52bbd1fc219050116593dd5a5',
        0),
    Task(
        'Comprar Teclado',
        'https://img.freepik.com/vetores-gratis/ilustracao-de-teclado-computador_53876-5567.jpg?w=740&t=st=1706189875~exp=1706190475~hmac=e5e0ee169c3b4a68afb4c4e0d59033e4a9b3280579ad088ed3a123d8b314b30d',
        0),
  ];

  void newTask(String name, String photo, int difficulty){taskList.add(Task(name, photo, difficulty));}

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited old) {
    return old.taskList.length != taskList.length;
  }
}
